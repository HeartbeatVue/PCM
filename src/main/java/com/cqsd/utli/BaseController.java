package com.cqsd.utli;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 分页方法控制器
 */
//@Controller
public class BaseController {
    @Autowired
    private HttpServletRequest request;

    /**
     * 分页方法的工具类
     * @return param 返回一个map
     */
    public Map<String, Object> getSearchCondition() {
        //存放请求中的参数
        Map<String, Object> param = new HashMap<>();
        //从请求中取出所有参数 用HttpServletRequest取出参数放入req的map中
        Map<String, String[]> req = request.getParameterMap();
        //从map中取出所有key
        Set<String> keys = req.keySet();
        //把所有参数存放进param集合中
        keys.forEach(s -> param.put(s, req.get(s)[0]));
//        keys.forEach(s -> {
//            param.put(s, req.get(s)[0]);
//        });
        //计算分页标签并把结果放入param
        if (param.get("page") != null && param.get("limit") != null) {
            int page = Integer.parseInt(param.get("page").toString());
            int limit = Integer.parseInt(param.get("limit").toString());
            param.put("limit",limit);
            param.put("page", (page - 1) * limit);
        }
        return param;
    }
}
