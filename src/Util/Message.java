package Util;

import java.util.Date;

public class Message {
    private String content;
    private Integer status;
    private Date time;

    public Message() {
        super();
    }

    public Message(String content, Integer status, Date time) {
        this.content = content;
        this.status = status;
        this.time = time;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
