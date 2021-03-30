package org.tufcookie.common.dto;

import lombok.Data;

@Data
public class PageDTO {
	
	private Integer page;
	private Integer perSheet;
	private String type, keyword;
	
	//default 설정
	public PageDTO() {
		
		this.page = 1;
		this.perSheet = 10;
		
	}
	
	public Integer getSkip() {
		
		return (page - 1) * perSheet;
		
	}
	
	public String[] getArr() {
		
		if(type == null) {
			
			return null;
		}
		
		if(keyword == null || keyword.trim().length() == 0) {
			
			return null;
		}
		
		return type.split("");
	}
	
	
}
