package com.tripon.biz.activity;

public class PagingVO {
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 한 페이지에 보여지는 글 갯수, 마지막페이지, SQL쿼리에 쓸 offset
	private int nowPage /*1*/, startPage /*1*/, endPage/*2*/, total/*10*/, cntPerPage/*5*/, lastPage/*2*/, start/*0*/;
	private int cntPage = 5; // 하단에 보여질 페이지 클릭할 수 있는 버튼 수
	
	public PagingVO() {}
	
	public PagingVO(int total, int nowPage, int cntPerPage) { // 10, 1, 5
		setNowPage(nowPage); // 1
		setTotal(total); // 10
		setCntPerPage(cntPerPage); // 5
		calcLastPage(total, cntPerPage); // 10, 5
		calcStartEndPage(nowPage, cntPage); // 1, 5
		calcStartEnd(nowPage, cntPerPage); // 1, 5
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) { // 10, 5
		if(total % cntPerPage > 0) { // if (0 > 0)
			setLastPage(total /cntPerPage+1);
		} else {
			setLastPage(total /cntPerPage); // setLastPage(10 / 5); = 2
		}
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) { // 1, 5
		if(nowPage<=cntPage) { // if (1<=5) true
			setStartPage(1);
		}else {
			if(nowPage%cntPage>0) {
				setStartPage(nowPage/cntPage*cntPage+1);
			}else {
				setStartPage(nowPage/cntPage*cntPage-cntPage+1);
			}
		}
		setEndPage(getStartPage()+cntPage-1); // setEndPage(1+5-1); = 5
		
		if (getLastPage() < getEndPage()) { // if (2 < 5()) true
			setEndPage(getLastPage()); // 2
		}
	}
	
	// DB 쿼리에서 사용할 start 값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		if(nowPage<=1) setStart(0);
		else setStart(nowPage * cntPerPage - cntPerPage);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) { //2
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int setCntPage() {
		return cntPage;
	}
	public void getCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", cntPage=" + cntPage + "]";
	}
}