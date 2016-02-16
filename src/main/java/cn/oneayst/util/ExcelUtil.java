package cn.oneayst.util;

import cn.oneayst.model.BrandModel;
import cn.oneayst.model.MaterialModel;
import cn.oneayst.model.ModuleModel;
import cn.oneayst.model.SpModel;
import cn.oneayst.service.BaseService;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class ExcelUtil {
    public static void downloadExcel(String serialNo, String type, XSSFWorkbook workbook, HttpServletResponse response) throws Exception {
        try (ByteArrayOutputStream os = new ByteArrayOutputStream()) {
            workbook.write(os);
            byte[] content = os.toByteArray();
            try (InputStream is = new ByteArrayInputStream(content);
                 BufferedInputStream bis = new BufferedInputStream(is);
                 ServletOutputStream out = response.getOutputStream();
                 BufferedOutputStream bos = new BufferedOutputStream(out)) {
                response.reset();
                response.setContentType("application/vnd.ms-excel;charset=utf-8");
                response.setCharacterEncoding("UTF-8");
                if (null != serialNo) {
                    serialNo = java.net.URLEncoder.encode(serialNo, "UTF-8");
                    serialNo = serialNo.replaceAll("%20", " ");
                    serialNo = serialNo.replaceAll("%28", "(");
                    serialNo = serialNo.replaceAll("%29", ")");
                }
                response.setHeader("Content-Disposition", "attachment;filename=" + new String(((null != serialNo ? type + "-" + serialNo : type + "-All") + ".xlsx").getBytes(),
                        "UTF-8"));


                byte[] buff = new byte[2048];
                int bytesRead;
                while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                    bos.write(buff, 0, bytesRead);
                }
            }
        }
    }


    /**
     * 按照预定好的格式读取excel
     * 目前思路:
     * 创建HashMap, key为材料名字， value为存储规格型号的List类型
     * 每次读取到一个材料就添加到map中, 并将该材料对应的规格型号添加到list中
     * <ul>
     * 1：在循环里读取子系统<br>
     * 2：添加子系统到数据库中， 并存储子系统的id<br>
     * 3：在子系统的循环中再创建一个读取材料的循环<br>
     * 4：每次读取到一个材料就添加到map中, 并将该材料对应的规格型号添加到list中<br>
     * 5：读取完材料后遍历map的key， 并且将材料依据子系统id插入到数据库中， 每插入一条就返回一个该材料的id<br>
     * 6：遍历材料对应的规格型号list, 并依据该材料的id插入到数据库中<br>
     * </ul>
     */
    public static void readExcel(CommonsMultipartFile file, BaseService baseService, long projectId) throws Exception {
        Workbook wb = WorkbookFactory.create(file.getInputStream());
        Sheet sheet = null;
        Row row = null;
        XSSFCell cell = null;
        final int sheetCount = wb.getNumberOfSheets();
        int rowCount = 0;
        Map<MaterialModel, List<SpModel>> materialMap = new HashMap<>();
        Map<ModuleModel, Map<MaterialModel, List<SpModel>>> moduleMap = new HashMap<>();
        Map<String, BrandModel> brandMap = new HashMap<>();
        List<SpModel> spList = null;
        String materialName = null;
        SpModel sp = null;
        ModuleModel module = null;
        MaterialModel material = null;
        String brandName = null;
        BrandModel brand = null;
        for (int sheetIndex = 0; sheetIndex < sheetCount; sheetIndex++) {
            sheet = wb.getSheetAt(sheetIndex);
//            rowCount = sheet.getPhysicalNumberOfRows();
            rowCount = sheet.getLastRowNum() + 1;
            if (2 > rowCount) {
                continue;
            }
            System.out.println("行数: " + rowCount);
            for (int rowIndex = 0; rowIndex < rowCount; rowIndex++) {
                row = sheet.getRow(rowIndex);
                if (null == row || -1 == row.getFirstCellNum()) {
                    System.out.println("    跳过行数: " + (rowIndex + 1));
//                    moduleMap.put(module, materialMap);
//                    break;
                    continue;
                }
                if (isMergedRegion(sheet, rowIndex, 0)) {
                    System.out.println("    模块名行数: " + (rowIndex + 1));
                    materialMap = new HashMap<>();
                    module = new ModuleModel();
                    module.setModuleName(row.getCell(0).getRichStringCellValue().toString().trim());
                    module.setProjectId(projectId);
                    moduleMap.put(module, materialMap);
                } else {
                    if (StringUtil.isNumeric(getCellFormatValue(row.getCell(0)).trim())) {
                        System.out.println("    解析行数： " + (rowIndex + 1));
                        materialName = getCellFormatValue(row.getCell(1)).trim();
                        if (StringUtil.isNullOrEmpty(materialName)) {
                            continue;
                        }

                        material = containsMaterial(materialMap, materialName);
                        if (null == material) {
                            material = new MaterialModel(0, materialName);
                            materialMap.put(material, new ArrayList<>());
                        }

                        sp = new SpModel();
                        sp.setSpName(getCellFormatValue(row.getCell(2)).trim());
                        sp.setUnit(getCellFormatValue(row.getCell(4)).trim());
                        sp.setContractAmount((int) Double.parseDouble(getCellFormatValue(row.getCell(5)).trim()));

                        brandName = getCellFormatValue(row.getCell(3)).trim();
                        if (StringUtil.isNullOrEmpty(brandName) || StringUtil.isNullOrEmpty(brandName)) {
                            brandName = "未知";
                        }

                        brand = brandMap.get(brandName);
                        if (null == brand) {
                            brand = new BrandModel();
                            brand.setBrandName(brandName);
                            brand.setProjectId(projectId);
                            brandMap.put(brandName, brand);
                        }
                        sp.setBrand(brand);

                        spList = materialMap.get(material);
                        spList.add(sp);
                    } else {
                        System.out.println("    不是数据行数: " + (rowIndex + 1) + "  cell(0): " + getCellFormatValue(row.getCell(0)));
                    }
                }
            }
        }
        System.out.println("解析完成但未保存时占用应用内存:" + (Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()));
        baseService.addByBatch(moduleMap, brandMap);
    }

    private static MaterialModel containsMaterial(Map<MaterialModel, List<SpModel>> materialMap, String materialName) {
        Iterator<MaterialModel> it = materialMap.keySet().iterator();
        MaterialModel material = null;
        while (it.hasNext()) {
            if (materialName.equals((material = it.next()).getMaterialName())) {
                return material;
            }
        }

        return null;
    }

    private static String getCellFormatValue(Cell cell) {
        String cellValue = null;
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
                case XSSFCell.CELL_TYPE_NUMERIC:
                case XSSFCell.CELL_TYPE_FORMULA: {
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        Date date = cell.getDateCellValue();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        cellValue = sdf.format(date);

                    } else {
                        cellValue = String.valueOf((int) cell.getNumericCellValue());
                    }
                    break;
                }
                case XSSFCell.CELL_TYPE_STRING:
                    cellValue = cell.getRichStringCellValue().getString();
                    break;
                default:
                    cellValue = "";
            }
        } else {
            cellValue = "";
        }
        return cellValue;
    }

    public static boolean isMergedRegion(Sheet sheet, int row, int column) {
        int sheetMergeCount = sheet.getNumMergedRegions();
        for (int i = 0; i < sheetMergeCount; i++) {
            CellRangeAddress ca = sheet.getMergedRegion(i);
            int firstColumn = ca.getFirstColumn();
            int lastColumn = ca.getLastColumn();
            int firstRow = ca.getFirstRow();
            int lastRow = ca.getLastRow();
            if (row >= firstRow && row <= lastRow) {
                if (column >= firstColumn && column <= lastColumn) {
                    return true;
                }
            }
        }
        return false;
    }
}
