package Member_Package;

import java.sql.Timestamp;

public class MemoDto {
	private String namae;
	private String title;
	private int num;
	public MemoDto() {
		// TODO 
	}
	public MemoDto(String namae, String title, int num) {
		// TODO
		this.namae = namae;
		this.title = title;
		this.num = num;
	}
	public String getNamae() {
		return namae;
	}

	public void setNamae(String namae) {
		this.namae = namae;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
}
