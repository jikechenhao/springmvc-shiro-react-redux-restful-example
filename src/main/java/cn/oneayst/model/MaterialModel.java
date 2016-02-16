package cn.oneayst.model;

import java.io.Serializable;

public class MaterialModel implements Serializable {
    private long materialId;
    private long moduleId;
    private String materialName;
    private String moduleName;

    public MaterialModel() {
    }

    public MaterialModel(long moduleId, String materialName) {
        this.moduleId = moduleId;
        this.materialName = materialName;
    }

    public long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(long materialId) {
        this.materialId = materialId;
    }

    public long getModuleId() {
        return moduleId;
    }

    public void setModuleId(long moduleId) {
        this.moduleId = moduleId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    @Override
    public String toString() {
        return "Material{" +
                "materialId=" + materialId +
                ", moduleId=" + moduleId +
                ", materialName='" + materialName + '\'' +
                ", moduleName='" + moduleName + '\'' +
                '}';
    }
}
