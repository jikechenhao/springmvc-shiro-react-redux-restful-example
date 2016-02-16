package cn.oneayst.controller;

import cn.oneayst.model.ApplyModel;
import cn.oneayst.model.ApplyRecordModel;
import cn.oneayst.model.ArrivedModel;
import cn.oneayst.model.PurchaseModel;
import cn.oneayst.service.OrderService;
import cn.oneayst.util.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("order")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;

    @RequiresRoles(value = {"pm", "purchase"}, logical = Logical.OR)
    @RequestMapping(value = "{moduleId}/record", method = RequestMethod.GET)
    public Map queryApplyRecord(@PathVariable long moduleId, @RequestBody(required = false) String serialNO, @RequestBody(required = false) Long projectId) throws Exception {
        return resultMap(true, orderService.queryApplyRecord(moduleId, serialNO, projectId));
    }

    @RequiresRoles(value = "pm")
    @RequestMapping(value = "{applyId}/arrived", method = RequestMethod.GET)
    public Map queryArrived(@PathVariable long applyId) throws Exception {
        return resultMap(true, orderService.queryArrived(applyId));
    }

    @RequiresRoles(value = "purchase")
    @RequestMapping(value = "{projectId}/condition/purchase", method = RequestMethod.GET)
    public Map queryPurchaseByCondition(@PathVariable long projectId, String serialNO, String listNO) throws Exception {
        return resultMap(true, orderService.queryPurchaseRecord(null, projectId, serialNO, listNO, false));
    }

    @RequiresRoles(value = {"storage", "boss"}, logical = Logical.OR)
    @RequestMapping(value = "{projectId}/storage", method = RequestMethod.GET)
    public Map queryConfirmedPurchase(@PathVariable long projectId) throws Exception {
        return resultMap(true, orderService.queryConfirmedPurchase(projectId));
    }

    @RequiresRoles(value = {"pm", "purchase"}, logical = Logical.OR)
    @RequestMapping(value = "{applyId}/purchase", method = RequestMethod.GET)
    public Map queryPurchase(@PathVariable long applyId) throws Exception {
        return resultMap(true, orderService.queryPurchase(applyId));
    }

    @RequiresRoles("pm")
    @RequestMapping(value = "record", method = RequestMethod.DELETE)
    public Map deleteApplyRecord(@RequestBody ApplyRecordModel apply) throws Exception {
        try {
            orderService.deleteApplyRecord(apply.getApplyId());
            return resultMap(true, "删除申请记录成功");
        } catch (DataIntegrityViolationException e) {
            return resultMap(false, "无能删除记录\n采购部已经有相应采购记录或者已填写到货量");
        }
    }

    @RequiresRoles("pm")
    @RequestMapping(value = "{applyId}/arrived", method = RequestMethod.PUT)
    public Map updateArrived(@RequestBody ArrivedModel[] arrivedList) throws Exception {
        orderService.updateArrived(Arrays.asList(arrivedList));
        return resultMap(true, "更新到货记录成功");
    }

    @RequiresRoles("purchase")
    @RequestMapping(value = "{purchaseId}/purchase", method = RequestMethod.PUT)
    public Map verifyPurchase(@PathVariable long purchaseId) throws Exception {
        orderService.verifyPurchase(purchaseId);
        return resultMap(true, "确认成功");
    }

    @RequiresRoles("pm")
    @RequestMapping(value = "{projectId}/{moduleId}/order", method = RequestMethod.POST)
    public Map createApply(@RequestBody ApplyModel[] applyList, @PathVariable long projectId, @PathVariable long moduleId) throws Exception {
        orderService.createApply(Arrays.asList(applyList), projectId, moduleId);
        return resultMap(true, "添加申请成功");
    }

    @RequiresRoles("purchase")
    @RequestMapping(value = "{projectId}/order", method = RequestMethod.POST)
    public Map createPurchase(@RequestBody PurchaseModel[] purchaseList, @PathVariable long projectId) throws Exception {
        orderService.createPurchase(Arrays.asList(purchaseList), projectId);
        return resultMap(true, "添加采购成功");
    }

    @RequiresRoles("pm")
    @RequestMapping(value = "excel", method = RequestMethod.GET)
    public void generateExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Object moduleId = request.getParameter("moduleId");
        Object projectId = request.getParameter("projectId");

        System.out.println("生成excel, moduleId:" + moduleId + ", projectId:" + projectId);
        XSSFWorkbook workbook = null;
        try {
            List<ApplyRecordModel> recordList = orderService.queryApplyRecord(
                    null != moduleId ? Long.parseLong(moduleId.toString()) : null,
                    null,
                    null != projectId ? Long.parseLong(projectId.toString()) : null
            );
            workbook = PmExcelUtil.createPmExcel(recordList);
            ExcelUtil.downloadExcel(null, "A", workbook, response);
        } catch (Exception e) {
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("创建excel文件失败");
            throw new RuntimeException("创建excel文件失败", e);
        }
    }

    @RequiresRoles("purchase")
    @RequestMapping(value = "purchase/excel", method = RequestMethod.GET)
    public void download(
            Long applyId,
            Long projectId,
            String serialNO,
            String listNO,
            Boolean confirmed,
            HttpServletResponse response
    ) throws Exception {
        if (null != serialNO) {
            serialNO = serialNO.startsWith("B-") ? serialNO.substring(2) : serialNO;
        }
        XSSFWorkbook workbook = null;
        workbook = PurchaseExcelUtil.createPurchaseExcel(orderService.queryPurchaseRecord(applyId, projectId, serialNO, listNO, confirmed));
        if (null != serialNO) {
            ExcelUtil.downloadExcel(serialNO, "B", workbook, response);
        } else {
            ExcelUtil.downloadExcel(listNO, "B", workbook, response);
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print("创建excel文件失败;\n");
    }

    @RequiresRoles("storage")
    @RequestMapping(value = "storage/excel", method = RequestMethod.GET)
    public void download(
            Long projectId,
            String materialName,
            String spName,
            String supplier,
            HttpServletResponse response
    ) throws Exception {
        System.out.println(spName);
        XSSFWorkbook workbook = null;
        workbook = StorageExcelUtil.createStorageExcel(orderService.queryConfirmedPurchase(projectId, materialName, spName, supplier));
        ExcelUtil.downloadExcel("项目详情", "B", workbook, response);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print("创建excel文件失败;\n");
    }

    @RequiresRoles("boss")
    @RequestMapping(value = "boss/excel", method = RequestMethod.GET)
    public void download(Long projectId, HttpServletResponse response) throws Exception {
        XSSFWorkbook workbook = null;
        workbook = BossExcelUtil.createBossExcel(orderService.queryConfirmedPurchase(projectId));
        ExcelUtil.downloadExcel("项目详情", "B", workbook, response);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print("创建excel文件失败;\n");
    }
}
