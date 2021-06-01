package com.cqsd.dao;

import com.cqsd.entity.PcCheckInfo;

import java.util.List;
import java.util.Map;

/**
 * 项目检查记录表数据库执行接口
 */
public interface PcCheckInfoMapper {
    List<PcCheckInfo> AllRecord(Map<String, Object> param);

    Integer count(Map<String, Object> param);
}
