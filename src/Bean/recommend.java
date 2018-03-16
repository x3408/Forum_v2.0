package Bean;

public class recommend {
	//这个是今日推荐的实体类
	
	private Integer id;
	//图片 类型为 String 放置路径
	private String recommend_image;
	//帖子的标题
	private String recommend_topic;
	//帖子的内容主体
	private String recommend_text;
	
	public recommend() {
		
	}
	

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRecommend_image() {
		return recommend_image;
	}
	public void setRecommend_image(String recommend_image) {
		this.recommend_image = recommend_image;
	}
	public String getRecommend_topic() {
		return recommend_topic;
	}
	public void setRecommend_topic(String recommend_topic) {
		this.recommend_topic = recommend_topic;
	}
	public String getRecommend_text() {
		return recommend_text;
	}
	public void setRecommend_text(String recommend_text) {
		this.recommend_text = recommend_text;
	}
	@Override
	public String toString() {
		return "recommend [id=" + id + ", recommend_image=" + recommend_image + ", recommend_topic=" + recommend_topic
				+ ", recommend_text=" + recommend_text + "]";
	}
	
	
	
}
