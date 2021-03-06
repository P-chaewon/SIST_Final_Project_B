package com.sist.b.ad;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sist.b.util.FileManager;
import com.sist.b.util.FilePathGenerator;

@Service
public class AdService {
	
	@Autowired
	private AdRepository adRepository;
	
	// 파일을 저장할 디렉토리 생성
	@Autowired
	private FilePathGenerator filePathGenerator; 
	
	@Autowired
	private ServletContext servletContext;
	
	// 파일을 HDD에 저장할 클래스
	@Autowired
	private FileManager fileManager;
	
	// 파일 저장 디렉토리명 application.properties에서 받아오기
	@Value("${board.ad.filePath}")
	private String filePath;
	
	public List<AdVO> getList() throws Exception {
		return adRepository.getList();
	}
	
	public AdVO getOne(AdVO adVO) throws Exception {
		return adRepository.getOne(adVO);
	}
	
	public int setInsert(AdVO adVO, MultipartFile file) throws Exception {
		// 글 insert
		int result = adRepository.setInsert(adVO);
		
		File file2 = filePathGenerator.getUseServletContext(filePath);
		String fileName = fileManager.saveTransferTo(file, file2);
		AdFileVO adFileVO = new AdFileVO();
		adFileVO.setAdNum(adVO.getAdNum());
		adFileVO.setFileName(fileName);
		adFileVO.setOriName(file.getOriginalFilename());
		result = adRepository.setFileInsert(adFileVO);
		
		return result;
	}
	
	public int setDelete(AdVO adVO) throws Exception {
		// HDD에서 파일 삭제
		String realPath = servletContext.getRealPath(filePath);
		File file = new File(realPath, adVO.getAdFile().getFileName());
		fileManager.fileDelete(file);
		
		// DB에서 글 삭제 (파일은 cascade)
		return adRepository.setDelete(adVO);
	}
	
	public AdVO getRandomAd() throws Exception {
		return adRepository.getRandomAd();
	}
}
