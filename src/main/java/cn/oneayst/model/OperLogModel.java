package cn.oneayst.model;

import java.io.Serializable;

public class OperLogModel extends LogModel implements Serializable {
    private String methodName;
    private long spentTime;

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public long getSpentTime() {
        return spentTime;
    }

    public void setSpentTime(long spentTime) {
        this.spentTime = spentTime;
    }

    @Override
    public String toString() {
        return "OperLogModel{" +
                "methodName='" + methodName + '\'' +
                ", spentTime=" + spentTime +
                "} " + super.toString();
    }
}
