package cn.oneayst.util;

import cn.oneayst.model.PurchaseRecordModel;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.xssf.usermodel.*;

import java.util.List;

public class PurchaseExcelUtil {

    public static XSSFWorkbook createPurchaseExcel(List<PurchaseRecordModel> purchaseRecordList) {
        XSSFWorkbook wb = export(purchaseRecordList);
        return wb;
    }

    public static XSSFWorkbook export(List<PurchaseRecordModel> purchaseRecordList) {
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("报表");
        XSSFRow row = sheet.createRow(0);
        XSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        createHeader(row, style);

        int columnWidth1 = "材料名称".getBytes().length;
        int columnWidth2 = "规格/型号".getBytes().length;
        int columnWidth3 = "品牌".getBytes().length;
        int columnWidth4 = "单位".getBytes().length;
        int columnWidth8 = "供应商".getBytes().length;
        int columnWidth9 = "送货单号".getBytes().length;

        for (int i = 0; i < purchaseRecordList.size(); i++) {
            row = sheet.createRow(i + 1);
            PurchaseRecordModel record = purchaseRecordList.get(i);

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
            cell.setCellValue(record.getUnitPrice().toString());

            cell = row.createCell(7);
            cell.setCellStyle(style);
            cell.setCellValue(record.getTotalCost().toString());

            cell = row.createCell(8);
            cell.setCellStyle(style);
            cell.setCellValue(record.getSupplier());
            columnWidth8 = record.getSupplier().getBytes().length > columnWidth8 ? record.getSupplier().getBytes().length : columnWidth8;

            cell = row.createCell(9);
            cell.setCellStyle(style);
            cell.setCellValue(record.getListNO());
            columnWidth9 = record.getListNO().getBytes().length > columnWidth9 ? record.getListNO().getBytes().length : columnWidth9;

            cell = row.createCell(10);
            cell.setCellStyle(style);
            cell.setCellValue(record.getArrivedAmount());

            cell = row.createCell(11);
            cell.setCellStyle(style);
            cell.setCellValue(record.isConfirmed() ? "已确认" : "未确认");
        }

        sheet.autoSizeColumn(0);
        sheet.setColumnWidth(1, columnWidth1 * 200);
        sheet.setColumnWidth(2, columnWidth2 * 170 > 2040 ? 2040 : columnWidth2 * 170);
        sheet.setColumnWidth(3, columnWidth3 * 200);
        sheet.setColumnWidth(4, columnWidth4 * 200);
        sheet.setColumnWidth(5, "申请数量".getBytes().length * 200);
        sheet.setColumnWidth(6, "单价".getBytes().length * 512);
        sheet.setColumnWidth(7, "金额".getBytes().length * 512);
        sheet.setColumnWidth(8, columnWidth8 * 200);
        sheet.setColumnWidth(9, columnWidth9 * 200);
        sheet.setColumnWidth(10, "实际到货数量".getBytes().length * 200);
        sheet.setColumnWidth(11, "采购确认".getBytes().length * 200);
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
        cell.setCellValue("单价");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("金额");
        cell.setCellStyle(style);

        cell = row.createCell(8);
        cell.setCellValue("供应商");
        cell.setCellStyle(style);

        cell = row.createCell(9);
        cell.setCellValue("送货单号");
        cell.setCellStyle(style);

        cell = row.createCell(10);
        cell.setCellValue("实际到货量");
        cell.setCellStyle(style);

        cell = row.createCell(11);
        cell.setCellValue("采购确认");
        cell.setCellStyle(style);
    }
}
