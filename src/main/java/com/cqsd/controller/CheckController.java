package com.cqsd.controller;

import com.cqsd.dao.PcUserMapper;
import com.cqsd.entity.PcCheckInfo;
import com.cqsd.service.PcCheckInfoService;
import com.cqsd.utli.ApiResponse;
import com.cqsd.utli.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/v1/Check")
public class CheckController extends BaseController {
    @Autowired
    private PcCheckInfoService pcCheckInfoService;
    @Autowired
    private PcUserMapper pcUserMapper;

    @GetMapping(value = "/checker")
    public String toucheck() {
        return "check/checkmana";
    }

    @ResponseBody
    @GetMapping(value = "info", headers = "Accept=application/json")
    public ApiResponse check() {
        Map<String, Object> param = this.getSearchCondition();
        List<PcCheckInfo> checkInfoList = pcCheckInfoService.AllRecord(param);
        int count = pcUserMapper.count(param);
        return ApiResponse.ok(count, checkInfoList);
    }

    @ResponseBody
    @GetMapping(value = "delete", headers = "Accept=application/json")
    @Transactional
    public ApiResponse delete(Integer id) {
        try {
            pcCheckInfoService.delUserId(id);
            return ApiResponse.ok("删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ApiResponse.fail(e.getMessage());
        }
    }


}
