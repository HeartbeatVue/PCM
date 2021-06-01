package com.cqsd.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
/**
 * 用户实体类
 * 通过Data 自动生成get set 方法
 * */
@Data
public class PcUser {
    private Integer id; //主键
    private String email;//邮箱
    private String name;//姓名
    private String password;//密码
    private String phone;//电话
    private String status;//状态
    private String username;//用户名
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createDate;//创建时间
    private Integer orgId;//机构ID
}
