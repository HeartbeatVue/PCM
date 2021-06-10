/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.service;

import com.cqsd.entity.PcOrgInfo;
import com.cqsd.utli.TreeNode;

import java.util.List;

public interface PcOrgInfoService {
    List<TreeNode> findAllTreeNode();

    void save(PcOrgInfo pcOrgInfo);
    /**
     * 根据id删除对象
     * @param id 机构表单的主键
     */
    void delete(Integer id);
}
