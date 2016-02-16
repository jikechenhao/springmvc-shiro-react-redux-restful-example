package cn.oneayst.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class PurchaseModel implements Serializable {
    private long purchaseId;
    private long applyId;
    private BigDecimal unitPrice;
    private int purchaseAmount;
    private BigDecimal totalCost;
    private String supplier;
    private long serialNO;
    private int arrivedAmount;
    private boolean confirmed;
    private String listNO;

    public PurchaseModel() {
    }

    public PurchaseModel(long applyId, BigDecimal unitPrice, int purchaseAmount, BigDecimal totalCost, String supplier, long serialNO, String listNO) {
        this.applyId = applyId;
        this.unitPrice = unitPrice;
        this.purchaseAmount = purchaseAmount;
        this.totalCost = totalCost;
        this.supplier = supplier;
        this.serialNO = serialNO;
        this.listNO = listNO;
    }

    public long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(long purchaseId) {
        this.purchaseId = purchaseId;
    }

    public long getApplyId() {
        return applyId;
    }

    public void setApplyId(long applyId) {
        this.applyId = applyId;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getPurchaseAmount() {
        return purchaseAmount;
    }

    public void setPurchaseAmount(int purchaseAmount) {
        this.purchaseAmount = purchaseAmount;
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

    public long getSerialNO() {
        return serialNO;
    }

    public void setSerialNO(long serialNO) {
        this.serialNO = serialNO;
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

    @Override
    public String toString() {
        return "PurchaseModel{" +
                "purchaseId=" + purchaseId +
                ", applyId=" + applyId +
                ", unitPrice=" + unitPrice +
                ", purchaseAmount=" + purchaseAmount +
                ", totalCost=" + totalCost +
                ", supplier='" + supplier + '\'' +
                ", serialNO=" + serialNO +
                ", arrivedAmount=" + arrivedAmount +
                ", confirmed=" + confirmed +
                ", listNO='" + listNO + '\'' +
                '}';
    }
}
