package Util;

public class Message {
    private String content;
    private Integer status;

    public Message() {
        super();
    }

    public Message(String content, Integer status) {
        this.content = content;
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
