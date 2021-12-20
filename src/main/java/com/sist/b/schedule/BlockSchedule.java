package com.sist.b.schedule;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.sist.b.report.ReportService;
import com.sist.b.suspend.SuspendService;
import com.sist.b.user.UserVO;

@EnableScheduling
@SpringBootApplication
public class BlockSchedule {
	
	@Autowired
	private ReportService reportService;
	@Autowired
	private SuspendService suspendService;
	
	//@Scheduled(cron = "*/10 * * * * *")
	@Scheduled(cron = "0 0 0 * * *")
	public void cronScheduleBlock()throws Exception {
		// 일정 신고 횟수 이상인 userNum 조회
		List<Long> ar = reportService.getReportCount();
		for (int i=0; i<ar.size(); i++) {
			UserVO userVO = new UserVO();
			userVO.setUserNum(ar.get(i));
			
			// 계정 비활성화, suspend에 추가
			suspendService.setCronInsert(userVO);
		}
	}
}
