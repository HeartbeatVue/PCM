/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.cqsd.utli;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import org.springframework.stereotype.Repository;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;


public class ReadQRImpl{
    public void AnalysisQR(String file) throws NotFoundException {
        MultiFormatReader formatReader = new MultiFormatReader();
        File file1 = new File(file);
        BufferedImage image = null;
        try {
            image = ImageIO.read(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image)));
        Hashtable hints = new Hashtable();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        Result result = formatReader.decode(binaryBitmap, hints);
        System.err.println("结果：" + result.toString());
        System.out.println("类型" + result.getBarcodeFormat());
//        System.out.println(result.getText());
    }
}
