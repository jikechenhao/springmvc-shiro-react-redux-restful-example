package cn.oneayst.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class ConfirmedPurchaseModel implements Serializable {
    private long applyId;
    private long materialId;
    private long spId;
    private int applyAmount;
    private int arrivedAmount;
    private int contractAmount;
    private BigDecimal unitPrice;
    private BigDecimal totalCost;
    private String unit;
    private String materialName;
    private String spName;
    private String brandName;
    private String supplier;

    public long getApplyId() {
        return applyId;
    }

    public void setApplyId(long applyId) {
        this.applyId = applyId;
    }

    public long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(long materialId) {
        this.materialId = materialId;
    }

    public long getSpId() {
        return spId;
    }

    public void setSpId(long spId) {
        this.spId = spId;
    }

    public int getApplyAmount() {
        return applyAmount;
    }

    public void setApplyAmount(int applyAmount) {
        this.applyAmount = applyAmount;
    }

    public int getArrivedAmount() {
        return arrivedAmount;
    }

    public void setArrivedAmount(int arrivedAmount) {
        this.arrivedAmount = arrivedAmount;
    }

    public int getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(int contractAmount) {
        this.contractAmount = contractAmount;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(BigDecimal totalCost) {
        this.totalCost = totalCost;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getSpName() {
        return spName;
    }

    public void setSpName(String spName) {
        this.spName = spName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    @Override
    public String toString() {
        return "ConfirmedPurchaseModel{" +
                "applyId=" + applyId +
                ", materialId=" + materialId +
                ", spId=" + spId +
                ", applyAmount=" + applyAmount +
                ", arrivedAmount=" + arrivedAmount +
                ", unitPrice=" + unitPrice +
                ", totalCost=" + totalCost +
                ", unit='" + unit + '\'' +
                ", materialName='" + materialName + '\'' +
                ", spName='" + spName + '\'' +
                ", brandName='" + brandName + '\'' +
                ", supplier='" + supplier + '\'' +
                '}';
    }
}
