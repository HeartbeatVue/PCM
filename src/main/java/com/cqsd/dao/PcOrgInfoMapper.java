/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.dao;

import com.cqsd.entity.PcOrgInfo;

import java.util.List;

public interface PcOrgInfoMapper {
    /**
     * 查找所有父节点
     * @return 父节点
     */
    List<PcOrgInfo> findAllRootNode();

    /**
     * 根据父节点ID返回所有子节点
     * @param parentId 父节点ID
     * @return 子节点
     */
    List<PcOrgInfo> findByIdSearchNode(Integer parentId);
}
