package com.cqsd.utli;

import lombok.Data;

import java.util.List;

/**
 * Api返回工具
 */
@Data
public class ApiResponse {
    private int code;
    private String msg;
    private int count;
    private List<?> data;

    public ApiResponse(int count, List<?> data) {
        this.code = 0;
        this.msg = "";
        this.count = count;
        this.data = data;
    }

    public ApiResponse(String msg,int code) {
        this.code = code;
        this.msg = msg;
    }


    /**
     *请求成功，返回分页数据
     * @param count 分页数据
     * @param data  返回的数据
     * @return json数据
     * */
    public static ApiResponse ok(int count,List<?> data){
        return new ApiResponse(count, data);
    }
    /**
     * 请求成功，返回提示信息
     * @param msg 提示信息
     * @return 成功信息
     * */
    public static ApiResponse ok(String msg){
        return new ApiResponse(msg,0);
    }
    /**
     * 请求失败
     * @param msg 提示信息
     * @return 失败信息
     * */
    public  static ApiResponse fail(String msg){
        return new ApiResponse(msg,1);
    }
}
