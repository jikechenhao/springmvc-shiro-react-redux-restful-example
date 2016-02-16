package cn.oneayst.model;

import java.io.Serializable;

public class LoginLogModel extends LogModel implements Serializable {
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "LoginLogModel{" +
                "message='" + message + '\'' +
                "} " + super.toString();
    }
}
