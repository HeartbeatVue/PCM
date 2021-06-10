package com.cqsd.dao;

import com.cqsd.entity.PcUser;

import java.util.List;
import java.util.Map;

/**
 * 用户表数据库的执行接口
 */
public interface PcUserMapper {
    /**
     * 分页查询
     * @param param 分页页码
     * @return List
     * */
    List<PcUser> findUser(Map<String,Object> param);

    /**
     * 根据条件查询数据总条数
     * @param param 数据总条数
     * @return 数据条数
     */
    Integer count(Map<String,Object> param);

    /**
     * 根据ID删除用户
     * @param id 用户主键
     * @return 删除用户
     */
    Integer delUserId(Integer id);

    /**
     * 添加用户数据
     * @param user 用户所有信息
     */
    void saveUser(PcUser user);

    /**
     * 通过用户ID修改数据
     * @param user 用户所有信息
     */
    void updateUser(PcUser user);

    /**
     * 查询用户机构
     * @param orgId 组织机构ID
     * @return 查询结果
     */
    Integer findUserOrg(Integer orgId);
}
