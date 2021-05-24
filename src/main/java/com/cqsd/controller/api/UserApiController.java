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

@RestController
@RequestMapping("/api/v1")
public class UserApiController extends AbstractApiController{
    /**
     * 其他程序请求的接口
    * */
    @Autowired
    private PcUserService pcUserService;
    @RequestMapping(value = "/users",method = RequestMethod.POST)
    public ApiResponseObject users(@RequestParam Integer page, Integer limit){
        Map<String, Object> param = new HashMap<>();
        param.put("page", page);
        param.put("limit", limit);
    return this.reponseJSON(ApiResponseEnum.SUCCESS.getCode(), ApiResponseEnum.SUCCESS.getName(),
        pcUserService.findUser(param));
    }

}
