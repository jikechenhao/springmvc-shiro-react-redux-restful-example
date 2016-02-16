package cn.oneayst.model;

import java.io.Serializable;

public class SpModel implements Serializable {
    private long spId;
    private long materialId;
    private String spName;
    private String unit;
    private int contractAmount;
    private int totalApplyAmount;
    private BrandModel brand;
    private String brandName;

    public long getSpId() {
        return spId;
    }

    public void setSpId(long spId) {
        this.spId = spId;
    }

    public long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(long materialId) {
        this.materialId = materialId;
    }

    public String getSpName() {
        return spName;
    }

    public void setSpName(String spName) {
        this.spName = spName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(int contractAmount) {
        this.contractAmount = contractAmount;
    }

    public int getTotalApplyAmount() {
        return totalApplyAmount;
    }

    public void setTotalApplyAmount(int totalApplyAmount) {
        this.totalApplyAmount = totalApplyAmount;
    }

    public BrandModel getBrand() {
        return brand;
    }

    public void setBrand(BrandModel brand) {
        this.brand = brand;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
