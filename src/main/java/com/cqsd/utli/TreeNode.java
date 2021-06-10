/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.utli;

import lombok.Data;

import java.util.List;
@Data
public class TreeNode {
    private Integer id;//ID
    private String title;//标题
    private List<TreeNode> children;//子节点
    private Boolean Spread=false;//是否展开
    private String filed;//全称

}
