package com.cqsd.entity;

import lombok.Data;

@Data
public class PcOrgInfo {
    private Integer id;//主键id
    private String fromSystem;//来源系统
    private String level;//级别
    private String orgCode;//说明
    private String orgFullName;//机构全称
    private String orgShort;//机构简称
    private String orgType;//机构类型
    private String remark;//备注
    private Integer parentId;//父级机构ID
    private String orgStatus;//机构状态
    private String parentName;//父机构名
}
