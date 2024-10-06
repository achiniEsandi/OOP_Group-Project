package control;

public class Video {

	private int id;
	private String date;
	private String title;
	private String catogary;
	private String filePath;
	private String video_url;
	private String description;
	
	//, String date
	public Video(int id, String title, String catogary, String filePath, String video_url,String description, String date) {
		this.id = id;
		this.date = date;
		this.title = title;
		this.catogary = catogary;
		this.filePath = filePath;
		this.video_url = video_url;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public String getDate() {
		return date;
	}

	public String getTitle() {
		return title;
	}

	public String getCatogary() {
		return catogary;
	}

	public String getFilePath() {
		return filePath;
	}

	public String getVideo_url() {
		return video_url;
	}

	public String getDescription() {
		return description;
	}

	
}
