//�Խñ� ����� �д� �ڹٺ� Ŭ����
package member;

import java.io.*; 
import java.sql.*;
import java.util.ArrayList;
public class BoardList {
	private ArrayList<Integer> seqNoList = new ArrayList<Integer>(); //�۹�ȣ
	private ArrayList<String> titleList = new ArrayList<String>(); //����
	private ArrayList<String> writerList = new ArrayList<String>(); //�̸�
	private ArrayList<String> dateList = new ArrayList<String>(); //��¥
	private ArrayList<String> contentList = new ArrayList<String>(); //������
	private ArrayList<Integer> heartList = new ArrayList<Integer>(); //���ƿ�
	private ArrayList<Integer> masterList = new ArrayList<Integer>();	//�������
	private ArrayList<Integer> attendList_max = new ArrayList<Integer>();	//�����ο���
	private ArrayList<Integer> attendList_min = new ArrayList<Integer>();
	private ArrayList<String> subjectList = new ArrayList<String>(); //�Խñ� ī�װ� ����
	
	private boolean lastPage = false; //������ ������ ����
	
	public BoardList() {
	}
	public void setSubject(int index, String subject) {
		this.subjectList.add(index,subject);
	}
	public void setSeqNo(int index, Integer seqNo) {
		this.seqNoList.add(index, seqNo);
	}
	public void setWriter(int index, String writer) {
		this.writerList.add(index, writer);
	}
	public void setTitle(int index, String title) {
		this.titleList.add(index, title);
	}
	public void setDate(int index, String date) {
		this.dateList.add(index, date);
	}
	public void setContent(int index, String content) {
		this.contentList.add(index, content);
	}
	public void setHeart(int index, Integer heart) {
		this.heartList.add(index, heart);
	}
	public void setMaster(int index, Integer master) {
		this.masterList.add(index, master);
	}
	public void setAttend_max(int index, Integer attend_max) {
		this.attendList_max.add(index, attend_max);
	}
	public void setAttend_min(int index, Integer attend_min) {
		this.attendList_min.add(index, attend_min);
	}
	public void setLastPage(boolean lastPage) {
		this.lastPage = lastPage;
	}
	
	public String[] getSubject() {
		return subjectList.toArray(new String[subjectList.size()]);
	}
	public Integer[] getSeqNo() {
		return seqNoList.toArray(new Integer[seqNoList.size()]);
	}
	public String[] getWriter() {
		return writerList.toArray(new String[writerList.size()]);
	}
	public String[] getTitle() {
		return titleList.toArray(new String[titleList.size()]);
	}
	public String[] getDate() {
		return dateList.toArray(new String[dateList.size()]);
	}
	public String[] getContent() {
		return contentList.toArray(new String[contentList.size()]);
	}
	public Integer[] getHeart() {
		return heartList.toArray(new Integer[heartList.size()]);
	}
	public Integer[] getMaster() {
		return masterList.toArray(new Integer[masterList.size()]);
	}
	public Integer[] getAttend_max() {
		return attendList_max.toArray(new Integer[attendList_max.size()]);
	}
	public Integer[] getAttend_min() {
		return attendList_min.toArray(new Integer[attendList_min.size()]);
	}
	public boolean isLastPage() {
		return lastPage;
	}								//������ ������ ����
	public int getListSize() {
		return seqNoList.size();
	}								//
}
