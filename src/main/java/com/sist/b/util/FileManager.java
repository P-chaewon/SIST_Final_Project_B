package com.sist.b.util;

import java.io.File;
import java.util.UUID;



import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	

	// file delete
	public void fileDelete(File file) throws Exception {
		file.delete();
	}
	
	// file save
	public String saveTransferTo(MultipartFile file, File dest) throws Exception {
		String fileName = null;
		fileName = UUID.randomUUID().toString()+"_"+file.getOriginalFilename();
		dest = new File(dest, fileName);
		file.transferTo(dest);
		return fileName;
	}

	@Autowired
	private ServletContext servletContext;
	@Autowired
	private ResourceLoader resourceLoader;
	
	// ServletContext
	public String getUseServletContext(String filePath, MultipartFile multipartFile) throws Exception {
		filePath = servletContext.getRealPath(filePath);
		File file = new File(filePath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		//파일 저장
		String fileName="";
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		file = new File(file, fileName);
		multipartFile.transferTo(file);
		System.out.println(filePath);
		
		return fileName;
	}
	
	//ResourceLoader
	public String getUseResourceLoader(String filePath, MultipartFile multipartFile) throws Exception {
		String path = "classpath:/static/";
		File file = new File(resourceLoader.getResource(path).getFile(), filePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileName = "";
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		file = new File(file, fileName);
		multipartFile.transferTo(file);
		System.out.println(filePath);
		
		return fileName;
	}


}
