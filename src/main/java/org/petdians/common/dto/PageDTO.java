package org.petdians.common.dto;

import lombok.Data;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Data
public class PageDTO {
	
	private Integer page;
	private Integer perSheet;
	private String type, keyword;
	private String day;
	
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
