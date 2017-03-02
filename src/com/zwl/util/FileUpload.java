package com.zwl.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

/**
 * @author 代江平
 * @date:2016年11月14日
 */
public class FileUpload {
	/**
	 * FILE
	 * 
	 * @param fileName
	 * @param file
	 * @param savePath
	 * (eg:upload)
	 * @return
	 */
/*		public static String upload(String fileName, File file, String savePath) {
		String[] s = fileName.split("\\.");
		String end = s[s.length-1];
		String fileNames = StringUtil.onlyString();
		String savePaths = ServletActionContext.getServletContext().getRealPath("/" + savePath + "/" + fileNames+"."+end);
		try {
			File destFile = new File(savePath,fileName );
			FileUtils.copyFile(file,destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileNames+"."+end;
	}*/
	public static String upload(String fileName, File file, String savePath) {
		System.out.println(fileName+"  "+file+" "+savePath);
		/*if(fileName!=null&&file!=null&&savePath!=null){*/

			try {
				String[] s = fileName.split("\\.");
				String end = s[s.length-1];
				String fileNames = StringUtil.onlyString();
				String savePaths = ServletActionContext.getServletContext().getRealPath("/" + savePath + "/" + fileNames+"."+end);
				FileInputStream fis = new FileInputStream(file);
				FileOutputStream fos = new FileOutputStream(savePaths);
				System.out.println(savePaths);
				IOUtils.copy(fis, fos);
				fos.flush();
				fos.close();
				fis.close();
				return fileNames+"."+end;
			} catch (Exception e) {
				e.printStackTrace();
			}
		return  null;
		/*}*/


	}

	public static void delete(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			return;
		} else {
			if (file.isFile())
				file.delete();
		}
	}
}
