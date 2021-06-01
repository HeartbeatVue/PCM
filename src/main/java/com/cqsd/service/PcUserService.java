package com.cqsd.service;

import com.cqsd.entity.PcUser;

import java.util.List;
import java.util.Map;

public interface PcUserService {
    /**
     * 分页查询
     * @param param 分页页码
     * @return List
     * */
    List<PcUser> findUser(Map<String,Object> param);
    /**
     * 根据ID删除用户
     * @param id 用户主键
     * @return 删除用户
     */
    Integer delUserId(Integer id);
}
