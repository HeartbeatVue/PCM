package com.cqsd.dao;

import com.cqsd.entity.PcUser;

import java.util.List;
import java.util.Map;
public interface PcUserMapper {
    /**
     * 分页查询
     * @param param 分页页码
     * @return List
     * */
    List<PcUser> findUser(Map<String,Object> param);

    /***
     * 根据条件查询数据总条数
     * @param param 数据总条数
     * @return 数据条数
     */
    Integer count(Map<String,Object> param);

}
