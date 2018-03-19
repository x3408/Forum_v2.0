package Bean;

public class Relation {
    private int id;
    private String uid;
    private String follow_uid;
    private int type;

    public Relation() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }


    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getFollow_uid() {
        return follow_uid;
    }

    public void setFollow_uid(String follow_uid) {
        this.follow_uid = follow_uid;
    }

    @Override
    public String toString() {
        return "Relation{" +
                "id=" + id +
                ", uid='" + uid + '\'' +
                ", follow_uid='" + follow_uid + '\'' +
                ", type=" + type +
                '}';
    }
}
