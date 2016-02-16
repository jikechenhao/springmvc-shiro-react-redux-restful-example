package cn.oneayst.util;

import cn.oneayst.model.ApplyRecordModel;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.xssf.usermodel.*;

import java.util.List;

public class PmExcelUtil {

    public static XSSFWorkbook createPmExcel(List<ApplyRecordModel> applyRecordList) {
        return export(applyRecordList);
    }

    public static XSSFWorkbook export(List<ApplyRecordModel> recordList) {
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("报表");
        XSSFRow row = sheet.createRow(0);
        XSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        createHeader(row, style);

        int columnWidth1 = "材料名称".getBytes().length;
        int columnWidth2 = "规格型号".getBytes().length;
        int columnWidth3 = "品牌".getBytes().length;
        int columnWidth4 = "单位".getBytes().length;
        int columnWidth6 = "备注".getBytes().length;
        int columnWidth7 = "系统批注".getBytes().length;

        System.out.println(recordList.size());
        for (int i = 0; i < recordList.size(); i++) {
            row = sheet.createRow(i + 1);
            ApplyRecordModel record = recordList.get(i);

            XSSFCell cell = row.createCell(0);
            cell.setCellStyle(style);
            cell.setCellValue(i + 1);

            cell = row.createCell(1);
            cell.setCellStyle(style);
            cell.setCellValue(record.getMaterialName());
            columnWidth1 = record.getMaterialName().getBytes().length > columnWidth1 ? record.getMaterialName().getBytes().length : columnWidth1;

            cell = row.createCell(2);
            cell.setCellStyle(style);
            cell.setCellValue(record.getSpName());
            columnWidth2 = record.getSpName().getBytes().length > columnWidth2 ? record.getSpName().getBytes().length : columnWidth2;


            cell = row.createCell(3);
            cell.setCellStyle(style);
            cell.setCellValue(record.getBrandName());
            columnWidth3 = record.getBrandName().getBytes().length > columnWidth3 ? record.getBrandName().getBytes().length : columnWidth3;


            cell = row.createCell(4);
            cell.setCellStyle(style);
            cell.setCellValue(record.getUnit());
            columnWidth4 = record.getUnit().getBytes().length > columnWidth4 ? record.getUnit().getBytes().length : columnWidth4;


            cell = row.createCell(5);
            cell.setCellStyle(style);
            cell.setCellValue(record.getApplyAmount());


            cell = row.createCell(6);
            cell.setCellStyle(style);
            cell.setCellValue(record.getComment());
            columnWidth6 = record.getComment().getBytes().length > columnWidth6 ? record.getComment().getBytes().length : columnWidth6;

            cell = row.createCell(7);
            cell.setCellStyle(style);
            StringBuilder sysComment = new StringBuilder();
            int overAmount = record.getApplyAmount() - record.getContractAmount();
            if (0 < overAmount) {
                sysComment.append("申请数量比合同上数量超出: ").append(overAmount);
            }
            sysComment
                    .append("总单数: ")
                    .append(record.getTotalPurchaseCount())
                    .append(", 已填写到货: ")
                    .append(record.getArrivedCount())
                    .append("单, 采购部已确认: ")
                    .append(record.getConfirmedCount());
            cell.setCellValue(sysComment.toString());
            columnWidth7 = sysComment.toString().getBytes().length > columnWidth7 ? sysComment.toString().getBytes().length : columnWidth7;
        }

        sheet.autoSizeColumn(0);
        sheet.setColumnWidth(1, columnWidth1 * 200);
        sheet.setColumnWidth(2, (columnWidth2 * 170 > 2040 ? 2040 : columnWidth2 * 170));
        sheet.setColumnWidth(3, columnWidth3 * 200);
        sheet.setColumnWidth(4, columnWidth4 * 200);
        sheet.autoSizeColumn("申请数量".getBytes().length * 200);
        sheet.setColumnWidth(6, columnWidth6 * 200);
        sheet.setColumnWidth(7, columnWidth7 * 200);
        return wb;
    }

    private static void createHeader(XSSFRow row, XSSFCellStyle style) {

        XSSFCell cell = row.createCell(0);
        cell.setCellValue("序号");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("材料名称");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("规格/型号");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("品牌");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("单位");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("申请数量");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("备注");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("系统批注");
        cell.setCellStyle(style);
    }
}
