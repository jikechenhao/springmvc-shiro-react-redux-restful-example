package cn.oneayst.model;

import java.io.Serializable;

public class ArrivedModel implements Serializable {
    private long purchaseId;
    private int arrivedAmount;
    private boolean confirmed;

    public long getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(long purchaseId) {
        this.purchaseId = purchaseId;
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
}
