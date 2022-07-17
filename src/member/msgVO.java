package member;

import java.util.ArrayList;
public class msgVO {
	private ArrayList<Integer> msgnoList = new ArrayList<>();
	private ArrayList<String> senderList = new ArrayList<>();
	private ArrayList<String> receiverList = new ArrayList<>();
	private ArrayList<String> contentList = new ArrayList<>();
	private ArrayList<String> kindList = new ArrayList<>();
	private boolean lastPage = false;
	
	public msgVO() {
	}
	public String[] getKind() {
		return kindList.toArray(new String[kindList.size()]);
	}
	public Integer[] getMsgno() {
		return msgnoList.toArray(new Integer[msgnoList.size()]);
	}
	public String[] getSender(){
		return senderList.toArray(new String[senderList.size()]);
	}
	public String[] getreceiver() {
		return receiverList.toArray(new String[receiverList.size()]);
	}
	public String[] getcontent() {
		return contentList.toArray(new String[contentList.size()]);
	}
	public boolean isLastPage() {
		return lastPage;
	}
	public int getListSize() {
		return senderList.size();
	}
	public void setKind(int index, String kind) {
		this.kindList.add(index, kind);
	}
	public void setMsgno(int index, Integer msgno) {
		this.msgnoList.add(index, msgno);
	}
	public void setSender(int index, String sender) {
		this.senderList.add(index, sender);
	}
	public void setReceiver(int index, String receiver) {
		this.receiverList.add(index, receiver);
	}
	public void setContent(int index, String content) {
		this.contentList.add(index, content);
	}
	public void setLastPage(boolean lastPage) {
		this.lastPage = lastPage;
	}

}
