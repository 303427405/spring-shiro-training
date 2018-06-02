package com.king.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class CreateCubicSpacePlan implements Serializable {
	private Integer id;
	// 标题
	private String title;
	// 描述
	private String desc;
	// 图片路径
	private String imgurl;
	// 最合适
	private String mostfit;
	// 价格
	private String unitprice;
	// 创建时间
	private Date createtime;
	// 修改时间
	private Date updatetime;
	// 最合适用list显示
	private List<String> mostfits;
	
	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc == null ? null : desc.trim();
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl == null ? null : imgurl.trim();
	}

	public String getMostfit() {
		return mostfit;
	}

	public void setMostfit(String mostfit) {
		this.mostfit = mostfit == null ? null : mostfit.trim();
	}

	public String getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice == null ? null : unitprice.trim();
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
	
	

	public List<String> getMostfits() {
		return mostfits;
	}

	public void setMostfits(List<String> mostfits) {
		this.mostfits = mostfits;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(id);
		sb.append(", title=").append(title);
		sb.append(", desc=").append(desc);
		sb.append(", imgurl=").append(imgurl);
		sb.append(", mostfit=").append(mostfit);
		sb.append(", unitprice=").append(unitprice);
		sb.append(", createtime=").append(createtime);
		sb.append(", updatetime=").append(updatetime);
		sb.append(", mostfits=").append(mostfits);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}
}