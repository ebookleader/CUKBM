package member;
import java.util.ArrayList;

public class IdVO {
	public IdVO() {
		
	}
	private ArrayList<String> Idlist = new ArrayList<String>();
	private ArrayList<String> Photolist = new ArrayList<String>();
	
	public String[] getIdlist() {
		return Idlist.toArray(new String[Idlist.size()]);
	}

	public void setIdlist(int index, String user) {
		this.Idlist.add(index, user);
	}
	
	public String[] getPhotolist() {
		return Photolist.toArray(new String[Photolist.size()]);
	}
	
	public void setPhotolist(int index, String photo) {
		this.Photolist.add(index, photo);
	}	
	public int getIdlistSize() {
		return Idlist.size();
	}
	public int getPhotolistSize() {
		return Photolist.size();
	}
}
