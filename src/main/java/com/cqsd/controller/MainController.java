package com.cqsd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "main")
public class MainController {
    /**
     * 返回主页
     * @return main.jsp
     * */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "main";
    }
}