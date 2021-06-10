/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.service;

import com.cqsd.dao.PcOrgInfoMapper;
import com.cqsd.dao.PcUserMapper;
import com.cqsd.entity.PcOrgInfo;
import com.cqsd.utli.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class PcOrgInfoServiceImpl implements PcOrgInfoService {
    @Autowired
    private PcOrgInfoMapper mapper;
    @Autowired
    private PcUserMapper pcUserMapper;

    @Override
    public List<TreeNode> findAllTreeNode() {
        List<TreeNode> nodes = new ArrayList<>();
        List<PcOrgInfo> roots = mapper.findAllRootNode();
        roots.forEach(pcOrgInfo -> {
            TreeNode root = new TreeNode();
            //子节点
            root.setId(pcOrgInfo.getId());
            root.setTitle(pcOrgInfo.getOrgFullName());
            root.setChildren(findAllChildren(pcOrgInfo.getId()));
            root.setFiled(pcOrgInfo.getOrgShort());
            root.setPid(pcOrgInfo.getParentId());
            root.setSpread(true);
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
            node.setFiled(c.getOrgShort());
            node.setChildren(findAllChildren(c.getId()));
            node.setPid(c.getParentId());
            node.setSpread(true);
            cnode.add(node);
        });
        return cnode;
    }


    @Transactional
    @Override
    public void save(PcOrgInfo pcOrgInfo) {
        if (pcOrgInfo.getId() == null) {
            mapper.addOrg(pcOrgInfo);
            //新增
        } else {
            //修改

        }
    }

    /**
     * 根据id删除对象
     *
     * @param id 机构表单的主键
     */
    @Override
    @Transactional
    public void delete(Integer id) {
        if (id == null && id <= 0) {
            throw new IllegalArgumentException("ID参数无效");
        }
        int count = pcUserMapper.findUserOrg(id);
        if (count > 0) throw new IllegalArgumentException("机构中存在用户，不能删除");
        List childrens = mapper.findByIdSearchNode(id);
        if (childrens != null && childrens.size() > 0) {
            throw new IllegalArgumentException("此机构中存在下级，请先删除下级机构");
        }
        mapper.delete(id);
    }
}
