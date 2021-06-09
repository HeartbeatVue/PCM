/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.service;

import com.cqsd.dao.PcOrgInfoMapper;
import com.cqsd.entity.PcOrgInfo;
import com.cqsd.utli.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PcOrgInfoServiceImpl implements PcOrgInfoService {
    @Autowired
    private PcOrgInfoMapper mapper;

    @Override
    public List<TreeNode> findAllTreeNode() {
        List<TreeNode> nodes = new ArrayList<>();
        List<PcOrgInfo> roots = mapper.findAllRootNode();
        roots.forEach(pcOrgInfo -> {
            TreeNode root = new TreeNode();
            root.setId(pcOrgInfo.getId());
            root.setTitle(pcOrgInfo.getOrgFullName());
            //子节点
            root.setChildren(findAllChildren(pcOrgInfo.getId()));
            nodes.add(root);
        });

        return nodes;
    }

    private List<TreeNode> findAllChildren(Integer parentId) {
        //查询子节点数据
        List<PcOrgInfo> children = mapper.findByIdSearchNode(parentId);
        //子节点list
        List<TreeNode> cnode = new ArrayList<>();
        children.forEach(c -> {
            TreeNode node = new TreeNode();
            node.setId(c.getId());
            node.setTitle(c.getOrgFullName());
            node.setChildren(findAllChildren(c.getId()));
            cnode.add(node);
        });
        return cnode;
    }
}
