package com.newface.page;

public class PageUtil {
	private int pageNum; //현재페이지
	private int startRow; //시작행번호
	private int endRow; //끝행번호
	private int totalPageCount; //전체페이지갯수
	private int startPageNum; //시작페이지번호
	private int endPageNum; //끝페이지번호
	private int rowBlockCount; //한페이지에보여질 글의 갯수
	private int pageBlockCount; //한페이지에 보여질 페이지 갯수
	private int totalRowCount; //전체글의 갯수
	
	public PageUtil() {}

	public PageUtil(int pageNum, int rowBlockCount, int pageBlockCount, int totalRowCount) {
		super();
		this.pageNum = pageNum;
		this.rowBlockCount = rowBlockCount;
		this.pageBlockCount = pageBlockCount;
		this.totalRowCount = totalRowCount;
		
		//시작행번호
		startRow=(pageNum-1)*rowBlockCount;
		//끝행번호
		endRow=rowBlockCount;
		//전체페이지갯수
		totalPageCount=(int)Math.ceil(totalRowCount/(double)rowBlockCount);
		//시작페이지번호
		startPageNum=(pageNum-1)/pageBlockCount*pageBlockCount+1;
		//끝페이지번호
		endPageNum=startPageNum+pageBlockCount-1;
		if(endPageNum>totalPageCount) {
			endPageNum=totalPageCount;
		}
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getRowBlockCount() {
		return rowBlockCount;
	}

	public void setRowBlockCount(int rowBlockCount) {
		this.rowBlockCount = rowBlockCount;
	}

	public int getPageBlockCount() {
		return pageBlockCount;
	}

	public void setPageBlockCount(int pageBlockCount) {
		this.pageBlockCount = pageBlockCount;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	
	
}

















