package com.zwl.util;



import org.apache.commons.io.FileUtils;

import java.io.File;
import java.util.UUID;

/**
 * Created by Acey on 2016/12/16.
 */

public class PictureUtil {
    /**
     * 上传文件
     * @param file 文件
     * @param typeName 后缀名
     * @param uploadPath 上传路径
     * @return
     */
    public static String upload(File file, String typeName,String uploadPath){
        //重新命名文件名
        String fileName = UUID.randomUUID().toString().replace("-", "")+"."+typeName.split("/")[1];
        //创建目标文件
        File destFile = new File(uploadPath,fileName );
        try {
            FileUtils.copyFile(file,destFile);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return fileName;
    }

    /**
     * 文件删除
     * @param path 文件路径
     * @param fileName 文件名
     * @return
     */
    public static Integer delete(String path,String fileName) {
        File file = new File(fileName);
        if (!file.exists()) {
            return 0;
        } else {
            if (file.isFile())
                file.delete();
        }
      return 1;
    }
}

