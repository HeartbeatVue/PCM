package com.cqsd.service;

import com.cqsd.dao.PcUserMapper;
import com.cqsd.entity.PcUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("pcUserService")
public class PcUserServiceImpl implements PcUserService {
    @Autowired
    private PcUserMapper pcUserMapper;

    @Override
    public List<PcUser> findUser(Map<String, Object> param) {
        if (param.get("page") == null || param.get("limit") == null) {
            throw new IllegalArgumentException("分页参数无效");
        }
        return pcUserMapper.findUser(param);
    }
}
