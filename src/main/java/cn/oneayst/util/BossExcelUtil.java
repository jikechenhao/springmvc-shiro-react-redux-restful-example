package cn.oneayst.util;

import cn.oneayst.model.ConfirmedPurchaseModel;
import cn.oneayst.model.ModuleModel;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.*;

import java.awt.*;
import java.util.List;

public class BossExcelUtil {
    public static XSSFWorkbook createBossExcel(List<ModuleModel> moduleList) {
        XSSFWorkbook wb = export(moduleList);
        return wb;
    }

    public static XSSFWorkbook export(List<ModuleModel> moduleList) {
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("报表");
        XSSFRow row = sheet.createRow(0);
        XSSFCellStyle normalStyle = wb.createCellStyle();
        XSSFCellStyle bgRedStyle = wb.createCellStyle();
        normalStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        bgRedStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        bgRedStyle.setFillForegroundColor(new XSSFColor(new Color(235, 204, 204)));
        bgRedStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);

        createHeader(row, normalStyle);

        int columnWidth1 = "材料名称".getBytes().length;
        int columnWidth2 = "规格/型号".getBytes().length;
        int columnWidth3 = "品牌".getBytes().length;
        int columnWidth4 = "单位".getBytes().length;


        int rowIndex = 1;
        for (ModuleModel module : moduleList) {
            row = sheet.createRow(rowIndex++);
            XSSFCell moduleCell = row.createCell(0);
            moduleCell.setCellValue("模块名");
            moduleCell = row.createCell(1);
            moduleCell.setCellValue(module.getModuleName());

            float rate = 0;
            for (ConfirmedPurchaseModel confirmedPurchase : module.getConfirmedPurchaseList()) {
                row = sheet.createRow(rowIndex++);
                XSSFCellStyle style = normalStyle;
                rate = (float)(confirmedPurchase.getArrivedAmount() - confirmedPurchase.getApplyAmount()) / confirmedPurchase.getApplyAmount();
                if (0 < rate) {
                    style = bgRedStyle;
                }

                XSSFCell cell = row.createCell(0);
                cell.setCellStyle(style);
                cell.setCellValue(rowIndex);

                cell = row.createCell(1);
                cell.setCellStyle(style);
                cell.setCellValue(confirmedPurchase.getMaterialName());
                columnWidth1 = confirmedPurchase.getMaterialName().getBytes().length > columnWidth1 ? confirmedPurchase.getMaterialName().getBytes().length : columnWidth1;

                cell = row.createCell(2);
                cell.setCellStyle(style);
                cell.setCellValue(confirmedPurchase.getSpName());
                columnWidth2 = confirmedPurchase.getSpName().getBytes().length > columnWidth2 ? confirmedPurchase.getSpName().getBytes().length : columnWidth2;


                cell = row.createCell(3);
                cell.setCellStyle(style);
                cell.setCellValue(confirmedPurchase.getBrandName());
                columnWidth3 = confirmedPurchase.getBrandName().getBytes().length > columnWidth3 ? confirmedPurchase.getBrandName().getBytes().length : columnWidth3;


                cell = row.createCell(4);
                cell.setCellStyle(style);
                cell.setCellValue(confirmedPurchase.getUnit());
                columnWidth4 = confirmedPurchase.getUnit().getBytes().length > columnWidth4 ? confirmedPurchase.getUnit().getBytes().length : columnWidth4;


                cell = row.createCell(5);
                cell.setCellStyle(style);
                cell.setCellValue(confirmedPurchase.getContractAmount());

                cell = row.createCell(6);
                cell.setCellStyle(style);
                cell.setCellValue(confirmedPurchase.getApplyAmount());


                cell = row.createCell(7);
                cell.setCellStyle(style);
                cell.setCellValue(confirmedPurchase.getArrivedAmount());


                cell = row.createCell(8);
                cell.setCellStyle(style);
                cell.setCellValue(String.format("%.2f", rate * 100) + "%");
            }
        }


        sheet.autoSizeColumn(0);
        sheet.setColumnWidth(1, columnWidth1 * 200);
        sheet.setColumnWidth(2, columnWidth2 * 170 > 2040 ? 2040 : columnWidth2 * 170);
        sheet.setColumnWidth(3, columnWidth3 * 200);
        sheet.setColumnWidth(4, columnWidth4 * 200);
        sheet.setColumnWidth(5, "合同数量".getBytes().length * 200);
        sheet.setColumnWidth(6, "预算数量".getBytes().length * 200);
        sheet.setColumnWidth(7, "到货数量".getBytes().length * 200);
        sheet.setColumnWidth(8, "损耗率".getBytes().length * 512);
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
        cell.setCellValue("合同数量");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("预算数量");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("到货数量");
        cell.setCellStyle(style);

        cell = row.createCell(8);
        cell.setCellValue("损耗率");
        cell.setCellStyle(style);
    }
}
