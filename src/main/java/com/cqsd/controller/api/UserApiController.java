package com.cqsd.controller.api;

import com.cqsd.common.ApiResponseEnum;
import com.cqsd.common.ApiResponseObject;
import com.cqsd.service.PcUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/***
 * 返回学生增删查改的API控制器
 */
@RestController
@RequestMapping("/api/v1")
public class UserApiController extends AbstractApiController{
    /**
     * 其他程序请求的接口
    * */
    @Autowired
    private PcUserService pcUserService;

    /***
     * 返回学生所有json数据
     * @param page 当前页码
     * @param limit 每一页有多少条数据
     * @return 学生的json数据
     */
    @RequestMapping(value = "/users",method = RequestMethod.POST)
    public ApiResponseObject users(@RequestParam Integer page, Integer limit){
        Map<String, Object> param = new HashMap<>();
        param.put("page", (page-1)*limit);
        param.put("limit", limit);
    return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(),
        pcUserService.findUser(param));
    }

}
