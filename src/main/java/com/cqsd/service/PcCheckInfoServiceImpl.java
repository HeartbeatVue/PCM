package com.cqsd.service;

import com.cqsd.dao.PcCheckInfoMapper;
import com.cqsd.entity.PcCheckInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("pcCheckInfoService")
public class PcCheckInfoServiceImpl implements PcCheckInfoService {
    @Autowired
    private PcCheckInfoMapper pcCheckInfoMapper;
    @Override
    public List<PcCheckInfo> AllRecord(Map<String,Object> param) {
        if (param.get("page") == null || param.get("limit") == null) {
            throw new IllegalArgumentException("分页参数无效");
        }
        return pcCheckInfoMapper.AllRecord(param);
    }

    @Override
    public Integer delUserId(Integer id) {
        if (id == null){
            throw new IllegalArgumentException("ID参数无效");
        }
        return pcCheckInfoMapper.delUserId(id);
    }
}
