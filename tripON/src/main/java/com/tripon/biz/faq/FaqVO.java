package com.tripon.biz.faq;

import java.sql.Date;

public class FaqVO {
	private int faq_seq;
	private String faq_mem_id;
	private String faq_title;
	private String faq_content;
	private String searchCondition;
	private String searchKeyword;
	private Date faq_regdate;
	private int faq_count;
	private String faq_category;
	private int[] deleteSeq;
	private int total;
	private int listCnt = 10;
	private int pageNum;
	private int rownum;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		pageNum = ((pageNum - 1) * listCnt);
		this.pageNum = pageNum;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public void setDeleteSeq(int[] deleteSeq) {
		this.deleteSeq = deleteSeq;
	}
	public int[] getDeleteSeq() {
		return deleteSeq;
	}
	public void setDeleteSeq(String[] deleteSeq) {
		int[] arr1 = new int[deleteSeq.length];
		for(int i =0; i < deleteSeq.length; i++) {
			arr1[i] = Integer.parseInt(deleteSeq[i]);
		}
		this.deleteSeq = arr1;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public int getFaq_seq() {
		return faq_seq;
	}
	public void setFaq_seq(int faq_seq) {
		this.faq_seq = faq_seq;
	}
	public String getFaq_mem_id() {
		return faq_mem_id;
	}
	public void setFaq_mem_id(String faq_mem_id) {
		this.faq_mem_id = faq_mem_id;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public Date getFaq_regdate() {
		return faq_regdate;
	}
	public void setFaq_regdate(Date faq_regdate) {
		this.faq_regdate = faq_regdate;
	}
	public int getFaq_count() {
		return faq_count;
	}
	public void setFaq_count(int faq_count) {
		this.faq_count = faq_count;
	}
	
}
