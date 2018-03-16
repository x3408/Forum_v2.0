package Bean;

import java.util.HashSet;
import java.util.Set;

public class User {
    private String uid;
    private String username;
    private String password;
    private String phoneNumber;
    //一对多 一的一方 对应回复版块的评论v用set
    private Set<comment> comments=new HashSet<>();

    public Set<comment> getComments() {
        return comments;
    }

    public void setComments(Set<comment> comments) {
        this.comments = comments;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
