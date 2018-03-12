package Bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Topic {
    private Integer tid;
    private String type;
    private String uid;
    private String title;
    private String descriptive;
    private String content;
    private Date time;
    private Integer viewCount;

    private Set<Reverts> reverts = new HashSet<>();




    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescriptive() {
        return descriptive;
    }

    public void setDescriptive(String descriptive) {
        this.descriptive = descriptive;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Set<Reverts> getReverts() {
        return reverts;
    }

    public void setReverts(Set<Reverts> reverts) {
        this.reverts = reverts;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }
}
