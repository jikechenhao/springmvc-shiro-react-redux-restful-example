package cn.oneayst.service;

import cn.oneayst.mapper.OrderMapper;
import cn.oneayst.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    @Lazy
    private ProjectService projectService;

    public List<ApplyRecordModel> queryApplyRecord(Long moduleId, String serialNO, Long projectId) throws Exception {
        return orderMapper.queryApplyRecord(moduleId, serialNO, projectId);
    }

    public List<PurchaseModel> queryPurchase(long applyId) throws Exception {
        return orderMapper.queryPurchase(applyId);
    }

    public List<ArrivedModel> queryArrived(long applyId) throws Exception {
        return orderMapper.queryArrived(applyId);
    }

    public List<PurchaseRecordModel> queryPurchaseRecord(Long applyId, Long projectId, String serialNO, String listNO, Boolean confirmed) throws Exception {
        return orderMapper.queryPurchaseRecord(applyId, projectId, serialNO, listNO, confirmed);
    }

    public List<ModuleModel> queryConfirmedPurchase(long projectId) throws Exception {
        return orderMapper.queryConfirmedPurchase(projectId, null, null, null);
    }

    public List<ModuleModel> queryConfirmedPurchase(Long projectId, String materialName, String spName, String supplier) throws Exception {
        return orderMapper.queryConfirmedPurchase(projectId, materialName, spName, supplier);
    }

    public void deleteOrderByModuleId(long moduleId) throws Exception {
        orderMapper.deleteOrderByModuleId(moduleId);
    }

    public void deleteOrderApplyByModuleId(long moduleId) throws Exception {
        orderMapper.deleteOrderApplyByModuleId(moduleId);
    }

    public void deleteApplyRecord(long applyId) throws Exception {
        Integer deletable = orderMapper.deletable(applyId);
        System.out.println("是否可以删除: " + deletable);
        if (0 == deletable) {
            orderMapper.deleteApplyRecord(applyId);
        } else {
            throw new DataIntegrityViolationException("有外键关联记录");
        }
    }

    public void updateArrived(List<ArrivedModel> arrivedList) throws Exception {
        orderMapper.updateArrived(arrivedList);
    }

    public void verifyPurchase(long purchaseId) throws Exception {
        orderMapper.verifyPurchase(purchaseId);
    }

    @Transactional(rollbackFor = {Exception.class})
    public void createApply(List<ApplyModel> applyList, long projectId, long moduleId) throws Exception {
        projectService.increaseSerialNOA(projectId);
        long serialNO = projectService.getSerialNOA(projectId);
        applyList.stream().forEach((apply) -> {
            apply.setModuleId(moduleId);
            apply.setSerialNO(String.valueOf(serialNO));
        });

        orderMapper.createApply(applyList);
    }

    @Transactional(rollbackFor = {Exception.class})
    public void createPurchase(List<PurchaseModel> purchaseList, long projectId) throws Exception {
        projectService.increaseSerialNOB(projectId);
        long serialNO = projectService.getSerialNOB(projectId);
        purchaseList.stream().forEach((purchase) -> purchase.setSerialNO(serialNO));

        orderMapper.createPurchase(purchaseList);
    }
}
