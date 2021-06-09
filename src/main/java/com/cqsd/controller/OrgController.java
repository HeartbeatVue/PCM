/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.controller;

import com.cqsd.service.PcOrgInfoService;
import com.cqsd.utli.ApiResponse;
import com.cqsd.utli.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "org")
public class OrgController {
    @Autowired
    private PcOrgInfoService service;

    @GetMapping(value = "/main")
    public String toOrg() {
        return "org/org";
    }

    @ResponseBody
    @GetMapping(value = "/allTreeNode")
    public ApiResponse findAllTreeNode() {
        try {
            List<TreeNode> nodes = service.findAllTreeNode();
            return ApiResponse.ok(0, nodes);
        } catch (Exception e) {
            return ApiResponse.fail(e.getMessage());
        }
    }
}
