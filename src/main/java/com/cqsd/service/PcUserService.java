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
}
