package com.king.model;

import java.io.Serializable;
import java.util.Date;

public class CreateCubicRecruit implements Serializable {
    private Integer recruitid;

    private String job;

    private String imgurl;

    private String jobrequire;

    private String contentdesc;

    private Date createtime;

    private Date updatetime;

    private static final long serialVersionUID = 1L;

    public Integer getRecruitid() {
        return recruitid;
    }

    public void setRecruitid(Integer recruitid) {
        this.recruitid = recruitid;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public String getJobrequire() {
        return jobrequire;
    }

    public void setJobrequire(String jobrequire) {
        this.jobrequire = jobrequire == null ? null : jobrequire.trim();
    }

    public String getContentdesc() {
        return contentdesc;
    }

    public void setContentdesc(String contentdesc) {
        this.contentdesc = contentdesc == null ? null : contentdesc.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", recruitid=").append(recruitid);
        sb.append(", job=").append(job);
        sb.append(", imgurl=").append(imgurl);
        sb.append(", jobrequire=").append(jobrequire);
        sb.append(", contentdesc=").append(contentdesc);
        sb.append(", createtime=").append(createtime);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}