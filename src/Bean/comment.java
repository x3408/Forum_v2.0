package Bean;

import com.alibaba.fastjson.annotation.JSONField;

public class comment {
    /*
    这是回复版块的评论实体
    * */

    //这个是评论的id
    private Integer id;
    //这是评论所在文章的id
    private String tid;
    //这是评论者的id
    private String uid;



    //这是评论者的昵称
    private String uid_name;
    //这是评论的内容
    private String comment_content;
    //一对多对应 多的一方 对应用户
    @JSONField(serialize = false)
    private User user;
    //一对多对应 多的一方 对应文章
    @JSONField(serialize = false)
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

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
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

    @Override
    public String toString() {
        return "comment{" +
                "uid='" + uid + '\'' +
                ", uid_name='" + uid_name + '\'' +
                ", comment_content='" + comment_content + '\'' +
                '}';
    }
}
