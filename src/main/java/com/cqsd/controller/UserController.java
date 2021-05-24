package com.cqsd.controller;

import com.cqsd.entity.PcUser;
import com.cqsd.service.PcUserService;
import com.cqsd.utli.ApiResponse;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "System")
public class UserController {
    @Autowired
    private PcUserService pcUserService;

    @RequestMapping(value = "/user")
    public String touser() {
        return "system/user";
    }
    /**
    * 后端服务请求的接口
    * */
    @ResponseBody
    @RequestMapping(value = "/users")
    public ApiResponse users(@RequestParam Integer page, Integer limit) {
        Map<String, Object> param = new HashMap<>();
        param.put("page", page-1);
        param.put("limit", limit);
        List<PcUser> users = pcUserService.findUser(param);
        return ApiResponse.ok(users.size(),users);
    }
}
