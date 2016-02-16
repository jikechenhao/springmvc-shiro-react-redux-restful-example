package cn.oneayst.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class LogModel implements Serializable {
    private int logId;
    private String account;
    private String host;
    private Timestamp occurTime;

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Timestamp getOccurTime() {
        return occurTime;
    }

    public void setOccurTime(Timestamp occurTime) {
        this.occurTime = occurTime;
    }

    @Override
    public String toString() {
        return "LogModel{" +
                "logId=" + logId +
                ", account='" + account + '\'' +
                ", host='" + host + '\'' +
                ", occurTime=" + occurTime +
                '}';
    }
}
