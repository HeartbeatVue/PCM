/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.utli;

import org.junit.jupiter.api.Test;

import java.io.IOException;


 class CreateQRImplTest{
    @Test
    void test() {
        try {
            CreateQRImpl.CreateQRcode("这是一个二维码", "png", "/Users/caseycheng/Downloads/1");
            System.out.println("创建成功");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("创建失败");
        }
    }
}