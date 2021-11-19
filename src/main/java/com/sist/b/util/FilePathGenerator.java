package com.sist.b.util;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FilePathGenerator {
	
	@Autowired
	private ServletContext servletContext;
	
	public File getUseServletContext(String filePath) throws Exception {
		// webapp 하위에 만들어짐
		filePath = servletContext.getRealPath(filePath);
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		System.out.println(filePath);
		return file;
	}
}
