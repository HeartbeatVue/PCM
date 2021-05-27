package com.cqsd.controller;

import com.cqsd.dao.PcUserMapper;
import com.cqsd.entity.PcCheckInfo;
import com.cqsd.service.PcCheckInfoService;
import com.cqsd.utli.ApiResponse;
import com.cqsd.utli.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/v1")
public class CheckController extends BaseController {
    @Autowired
    private PcCheckInfoService pcCheckInfoService;
    @Autowired
    private PcUserMapper pcUserMapper;

    @RequestMapping(value = "/checker", method = RequestMethod.GET)
    public String toucheck() {
        return "check/checkmana";
    }

    @ResponseBody
    @RequestMapping(value = "info", method = RequestMethod.GET, headers = "Accept=application/json")
    public ApiResponse check() {
        Map<String, Object> param = this.getSearchCondition();
        List<PcCheckInfo> checkInfoList = pcCheckInfoService.AllRecord(param);
        int count = pcUserMapper.count(param);
        return ApiResponse.ok(count,checkInfoList);
    }
}
