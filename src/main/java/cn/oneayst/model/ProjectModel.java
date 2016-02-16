package cn.oneayst.model;

import java.io.Serializable;
import java.sql.Date;

public class ProjectModel implements Serializable {
    private Long projectId;
    private String projectName;
    private String contractNO;
    private Date createDate;

    public ProjectModel() {
    }

    public ProjectModel(String projectName, String contractNO) {
        this.projectName = projectName;
        this.contractNO = contractNO;
    }

    public ProjectModel(Long projectId, String projectName, String contractNO, Date createDate) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.contractNO = contractNO;
        this.createDate = createDate;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getContractNO() {
        return contractNO;
    }

    public void setContractNO(String contractNO) {
        this.contractNO = contractNO;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "ProjectModel{" +
                "projectId=" + projectId +
                ", projectName='" + projectName + '\'' +
                ", contractNO='" + contractNO + '\'' +
                ", createDate=" + createDate +
                '}';
    }
}
