package com.sist.b.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post/**")
public class PostController {
	
	@GetMapping("upload")
	public void setPostUpload()throws Exception{
		
	}

}
