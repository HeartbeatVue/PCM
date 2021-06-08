/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.utli;

import com.google.zxing.*;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.springframework.stereotype.Repository;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;


public class CreateQRImpl  {
    public static void CreateQRcode(String contents, String format, String path) throws IOException {
        int width = 300;
        int height = 300;
        //二维码相关参数
        HashMap hints = new HashMap();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        //这下面两个参数会导致机器扫描二维码透明变为全黑
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
//        hints.put(EncodeHintType.MARGIN, 2);
        hints.put(DecodeHintType.TRY_HARDER, Boolean.TRUE);
        hints.put(DecodeHintType.PURE_BARCODE, Boolean.TRUE);
        BitMatrix bitMatrix;
        try {
            bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height, hints);
            Path file = new File(path).toPath();//生成二维码图片
            MatrixToImageWriter.writeToPath(bitMatrix, format, file);
            System.out.println("已在"+path+""+"生成二维码");
        } catch (WriterException e) {
            e.printStackTrace();
        }
    }
};


