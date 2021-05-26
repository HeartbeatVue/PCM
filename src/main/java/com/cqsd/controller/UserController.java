package com.cqsd.controller;

import com.cqsd.dao.PcUserMapper;
import com.cqsd.entity.PcUser;
import com.cqsd.service.PcUserService;
import com.cqsd.utli.ApiResponse;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * 学生信息后台页面和json数据控制器，为项目数据下的System路径
 */
@Controller
@RequestMapping(value = "System")
public class UserController {
    @Autowired
    private PcUserService pcUserService;
    @Autowired
    private PcUserMapper pcUserMapper;

    /***
     * 返回用户列表页
     * @return system/user 列表页
     */
    @RequestMapping(value = "/user")
    public String touser() {
        return "system/user";
    }

    /**
     * 后端服务请求的接口
     *
     * @param page  页码
     * @param limit 每页数据
     * @param name  单独查询的name
     * @return json数据
     */
    @ResponseBody
    @RequestMapping(value = "/users", method = RequestMethod.GET, headers = "Accept=application/json")
    public ApiResponse users(@RequestParam() Integer page, Integer limit, String name,Integer id) {
        Map<String, Object> param = new HashMap<>();
        System.out.println("page = " + page + ", limit = " + limit + "计算前的数据");
        param.put("page", (page - 1) * limit);
        param.put("limit", limit);
        param.put("name", name);
        if (id == null){
            System.out.println("id为空");
        }else {
            param.put("id",id);
        }
        List<PcUser> users = pcUserService.findUser(param);
        //取出总条数
        int count = pcUserMapper.count(param);
//        System.out.println("UserController.users");
//        System.out.println("users = "+users);
        System.out.println("page = " + page + ", limit = " + limit + "计算后的数据");
        return ApiResponse.ok(count, users);
    }
}
