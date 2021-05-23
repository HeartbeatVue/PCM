package com.cqsd.utli;

import lombok.Data;

import java.util.List;

@Data
public class ApiResponse {
    private int code;
    private String msg;
    private int count;
    private List data;

    public ApiResponse(int count, List data) {
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
     * @param count
     * @param data
     * @return
     * */
    public static ApiResponse ok(int count,List data){
        return new ApiResponse(count, data);
    }
    /**
     * 请求成功，返回提示信息
     * @param msg
     * @return
     * */
    public static ApiResponse ok(String msg){
        return new ApiResponse(msg,0);
    }
    /**
     * 请求失败
     * */
    public  static ApiResponse fail(String msg){
        return new ApiResponse(msg,1);
    }
}
