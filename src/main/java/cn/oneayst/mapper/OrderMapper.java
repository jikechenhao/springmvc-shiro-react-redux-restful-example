package cn.oneayst.mapper;

import cn.oneayst.model.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {

    List<ApplyRecordModel> queryApplyRecord(
            @Param("moduleId") Long moduleId,
            @Param("serialNO") String serialNO,
            @Param("projectId") Long projectId
    ) throws Exception;

    List<PurchaseModel> queryPurchase(@Param("applyId") long applyId) throws Exception;

    List<ArrivedModel> queryArrived(@Param("applyId") long applyId) throws Exception;

    List<PurchaseRecordModel> queryPurchaseRecord(
            @Param("applyId") Long applyId,
            @Param("projectId") Long projectId,
            @Param("serialNO") String serialNO,
            @Param("listNO") String listNO,
            @Param("confirmed") Boolean confirmed
    ) throws Exception;

    List<ModuleModel> queryConfirmedPurchase(
            @Param("projectId") long projectId,
            @Param("materialName") String materialName,
            @Param("spName") String spName,
            @Param("supplier") String supplier
    ) throws Exception;

    void deleteOrderApplyByModuleId(@Param("moduleId") long moduleId) throws Exception;

    void deleteOrderByModuleId(@Param("moduleId") long moduleId) throws Exception;

    Integer deletable(@Param("applyId") long applyId) throws Exception;

    void deleteApplyRecord(@Param("applyId") long applyId) throws Exception;

    void updateArrived(List<ArrivedModel> arrivedList) throws Exception;

    void verifyPurchase(@Param("purchaseId") long purchaseId) throws Exception;

    void createApply(List<ApplyModel> applyList) throws Exception;

    void createPurchase(List<PurchaseModel> purchaseList) throws Exception;
}
