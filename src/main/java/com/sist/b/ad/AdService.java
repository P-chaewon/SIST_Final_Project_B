package com.sist.b.ad;

import java.nio.file.Path;
import java.util.List;

import javax.validation.Valid;

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
		// file save
		int result = adRepository.setInsert(adVO);
		//File file = filePathGenerator
		
		return result;
	}
	
	public int setDelete(AdVO adVO) throws Exception {
		return adRepository.setDelete(adVO);
	}
}
