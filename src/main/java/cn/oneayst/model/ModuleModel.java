package cn.oneayst.model;

import java.io.Serializable;
import java.util.List;

public class ModuleModel implements Serializable {
    private long moduleId;
    private String moduleName;
    private long projectId;
    private List<MaterialModel> materialList;
    private List<ApplyRecordModel> recordList;
    private List<ConfirmedPurchaseModel> confirmedPurchaseList;

    public long getModuleId() {
        return moduleId;
    }

    public void setModuleId(long moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public List<MaterialModel> getMaterialList() {
        return materialList;
    }

    public void setMaterialList(List<MaterialModel> materialList) {
        this.materialList = materialList;
    }

    public List<ApplyRecordModel> getRecordList() {
        return recordList;
    }

    public void setRecordList(List<ApplyRecordModel> recordList) {
        this.recordList = recordList;
    }

    public List<ConfirmedPurchaseModel> getConfirmedPurchaseList() {
        return confirmedPurchaseList;
    }

    public void setConfirmedPurchaseList(List<ConfirmedPurchaseModel> confirmedPurchaseList) {
        this.confirmedPurchaseList = confirmedPurchaseList;
    }

    @Override
    public String toString() {
        return "Module{" +
                "moduleId=" + moduleId +
                ", moduleName='" + moduleName + '\'' +
                ", projectId=" + projectId +
                '}';
    }
}
