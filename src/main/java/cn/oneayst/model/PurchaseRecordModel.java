package cn.oneayst.model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by huang on 2015/10/16.
 */
public class PurchaseRecordModel implements Serializable {
    private long purchaseId;
    private String materialName;
    private String spName;
    private String brandName;
    private String unit;
    private int purchaseAmount;
    private int applyAmount;
    private BigDecimal unitPrice;
    private BigDecimal totalCost;
    private String supplier;
    private int arrivedAmount;
    private boolean confirmed;
    private String listNO;
    private String serialNO;

    public long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(long purchaseId) {
        this.purchaseId = purchaseId;
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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getPurchaseAmount() {
        return purchaseAmount;
    }

    public void setPurchaseAmount(int purchaseAmount) {
        this.purchaseAmount = purchaseAmount;
    }

    public int getApplyAmount() {
        return applyAmount;
    }

    public void setApplyAmount(int applyAmount) {
        this.applyAmount = applyAmount;
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

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public int getArrivedAmount() {
        return arrivedAmount;
    }

    public void setArrivedAmount(int arrivedAmount) {
        this.arrivedAmount = arrivedAmount;
    }

    public boolean isConfirmed() {
        return confirmed;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

    public String getListNO() {
        return listNO;
    }

    public void setListNO(String listNO) {
        this.listNO = listNO;
    }

    public String getSerialNO() {
        return serialNO;
    }

    public void setSerialNO(String serialNO) {
        this.serialNO = serialNO;
    }
}
