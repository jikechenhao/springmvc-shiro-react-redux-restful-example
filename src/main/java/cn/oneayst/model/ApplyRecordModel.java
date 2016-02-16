package cn.oneayst.model;

import java.io.Serializable;

public class ApplyRecordModel implements Serializable {
    private long applyId;
    private String moduleName;
    private String materialName;
    private String spName;
    private String brandName;
    private String unit;
    private String comment;
    private String applyUser;
    private int applyAmount;
    private int arrivedAmount;
    private String serialNO;
    private int contractAmount;
    private int confirmedCount;
    private int arrivedCount;
    private int totalPurchaseCount;
    private boolean waitConfirmed;

    public long getApplyId() {
        return applyId;
    }

    public void setApplyId(long applyId) {
        this.applyId = applyId;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getApplyUser() {
        return applyUser;
    }

    public void setApplyUser(String applyUser) {
        this.applyUser = applyUser;
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

    public String getSerialNO() {
        return serialNO;
    }

    public void setSerialNO(String serialNO) {
        this.serialNO = serialNO;
    }

    public int getConfirmedCount() {
        return confirmedCount;
    }

    public void setConfirmedCount(int confirmedCount) {
        this.confirmedCount = confirmedCount;
    }

    public int getArrivedCount() {
        return arrivedCount;
    }

    public void setArrivedCount(int arrivedCount) {
        this.arrivedCount = arrivedCount;
    }

    public int getTotalPurchaseCount() {
        return totalPurchaseCount;
    }

    public void setTotalPurchaseCount(int totalPurchaseCount) {
        this.totalPurchaseCount = totalPurchaseCount;
    }

    public boolean isWaitConfirmed() {
        return waitConfirmed;
    }

    public void setWaitConfirmed(boolean waitConfirmed) {
        this.waitConfirmed = waitConfirmed;
    }

    @Override
    public String toString() {
        return "ApplyRecordModel{" +
                "applyId=" + applyId +
                ", moduleName='" + moduleName + '\'' +
                ", materialName='" + materialName + '\'' +
                ", spName='" + spName + '\'' +
                ", brandName='" + brandName + '\'' +
                ", unit='" + unit + '\'' +
                ", comment='" + comment + '\'' +
                ", applyUser='" + applyUser + '\'' +
                ", applyAmount=" + applyAmount +
                ", arrivedAmount=" + arrivedAmount +
                ", serialNO='" + serialNO + '\'' +
                ", contractAmount=" + contractAmount +
                ", confirmedCount=" + confirmedCount +
                ", arrivedCount=" + arrivedCount +
                ", totalPurchaseCount=" + totalPurchaseCount +
                ", waitConfirmed=" + waitConfirmed +
                '}';
    }
}
