package com.sist.b.post.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class PostFileManager {
	

	@Autowired
	private ServletContext servletContext;

	
	//ServletContext 사용
	
	public String getUseServletContext(String filePath, MultipartFile multipartFile)throws Exception{
		
		filePath = servletContext.getRealPath(filePath);
		File file = new File(filePath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName = "";
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		file = new File(file, fileName);
		
		multipartFile.transferTo(file);
		
		return fileName;
		
	
	}

}
