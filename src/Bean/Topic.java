package Bean;

import java.util.Date;
import java.util.Set;

public class Topic {
    private Integer id;
    private Integer type;
    private Integer uid;
    private String title;
    private String descriptive;
    private Byte content;
    private Date time;


    private Set<Reverts> reverts;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
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

    public Byte getContent() {
        return content;
    }

    public void setContent(Byte content) {
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
}
