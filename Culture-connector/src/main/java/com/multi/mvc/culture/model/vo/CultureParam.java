package com.multi.mvc.culture.model.vo;

import java.util.Arrays;
import java.util.List;

// BoardParam : 검색창 파라메터 받아오는 객체
// 설계 요령 
// 1. form의 name과 종류와 일치해서 파라메터 설계 필요
// 2. types의 경우 마이바티스 호환성을 위해 typeList 설계 추가 필요
// 3. 페이징 처리를 위해 page, limit, offset을 따로 설계 필요

public class CultureParam {
	// html - form의 name과 일치하는 파라메터
	private String searchType;
	private String searchValue;
	private String[] types;
	private List<String> typeList;
	private String checkBox;

	// 페이징 인자
	private int page;
	private int limit;
	private int offset;

	public CultureParam() {
		super();
		page = 1; 
	}

	public CultureParam(String searchType, String searchValue, String[] types, String checkBox, int page, int limit,
			int offset) {
		super();
		this.searchType = searchType;
		this.searchValue = searchValue;
		setTypes(types);
		this.checkBox = checkBox;
		this.page = page;
		this.limit = limit;
		this.offset = offset;
	}

	@Override
	public String toString() {
		return "BoardParam [searchType=" + searchType + ", searchValue=" + searchValue + ", types="
				+ Arrays.toString(types) + ", checkBox=" + checkBox + ", typeList=" + typeList + ", page=" + page + ", limit=" + limit
				+ ", offset=" + offset + "]";
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String[] getTypes() {
		return types;
	}

	// Spring command 패턴에서는 setter로 인자를 주입함 -> 주입 받은 객체가 null이 아니면 list로 바꿔서 활용
	public void setTypes(String[] types) {
		this.types = types;
		if(types != null) {
			typeList = List.of(types);
		}
	}

	public List<String> getTypeList() {
		return typeList;
	}
	
	

	public String getCheckBox() {
		return checkBox;
	}

	public void setCheckBox(String checkBox) {
		this.checkBox = checkBox;
	}

	public void setTypeList(List<String> typeList) {
		this.typeList = typeList;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

}
