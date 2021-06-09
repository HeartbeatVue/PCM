package com.cqsd.service;

import com.cqsd.entity.PcCheckInfo;

import java.util.List;
import java.util.Map;

public interface PcCheckInfoService {
    List<PcCheckInfo> AllRecord(Map<String,Object> param);
    Integer delUserId(Integer id);
}
