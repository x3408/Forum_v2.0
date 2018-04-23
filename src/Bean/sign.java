package Bean;

public class sign {
    //这是打卡的实体类
    private Integer id;


    //这是评论者的id
    private String uid;
    private String content;

    public Integer getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setId(Integer id) {

        this.id = id;
    }


    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "sign{" +
                "id=" + id +
                ", uid='" + uid + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
