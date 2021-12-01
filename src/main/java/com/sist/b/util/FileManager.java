package com.sist.b.util;

import java.io.File;
import java.util.UUID;

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
}
