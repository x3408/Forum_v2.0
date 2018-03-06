package Bean;

public class Relation {
    private int id;
    private int uid;
    private int follow_uid;
    private int type;

    public Relation() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }


    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getFollow_uid() {
        return follow_uid;
    }

    public void setFollow_uid(int follow_uid) {
        this.follow_uid = follow_uid;
    }
}
