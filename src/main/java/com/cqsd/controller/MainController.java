package com.cqsd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * 主方法的返回页面，路径为main。
 */
@Controller
@RequestMapping(value = "main")
public class MainController {
    /**
     * 返回主页
     * @return main.jsp
     * */
    @GetMapping(value = "/index")
    public String index() {
        return "main";
    }
}
