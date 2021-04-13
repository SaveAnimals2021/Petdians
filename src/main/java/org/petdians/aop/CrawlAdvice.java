package org.petdians.aop;


import lombok.extern.java.Log;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
@Log
public class CrawlAdvice {

    // 2. doA만 거는 방법
	@Before(value="execution(* org.petdians.crawling.service.*.crawlView(..))")
	public void logBefore() {
		log.info("========== BEFORE Crawl ==========");
	}
}
