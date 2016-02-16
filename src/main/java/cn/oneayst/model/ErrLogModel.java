package cn.oneayst.model;

import java.io.Serializable;

public class ErrLogModel extends LogModel implements Serializable {
    private String methodName;
    private String exception;

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }

    @Override
    public String toString() {
        return "ErrLogModel{" +
                "methodName='" + methodName + '\'' +
                ", exception='" + exception + '\'' +
                "} " + super.toString();
    }
}
