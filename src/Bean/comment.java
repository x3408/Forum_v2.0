package Bean;

public class comment {
    /*
    这是回复版块的评论实体
    * */

    //这个是评论的id
    private Integer id;
    //这是评论所在文章的id
    private Integer tid;
    //这是评论者的id
    private Integer uid;
    //这是评论者的昵称
    private String uid_name;
    //这是评论的内容
    private String comment_content;
    //一对多对应 多的一方 对应用户
    private User user;
    //一对多对应 多的一方 对应文章
    private Topic topic;

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUid_name() {
        return uid_name;
    }

    public void setUid_name(String uid_name) {
        this.uid_name = uid_name;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }
}
