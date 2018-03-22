package Bean;

import java.util.Set;

public class User {
    private String uid;
    private String username;
    private String password;
    private String phoneNumber;
    private String sex;
    private String headPortrait;
    private String signature;

    public String getSignature() { return signature; }

    public void setSignature(String signature) { this.signature = signature; }

    public String getHeadPortrait() { return headPortrait; }

    public void setHeadPortrait(String headPortrait) { this.headPortrait = headPortrait; }

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

    public String getSex() { return sex; }

    public void setSex(String sex) { this.sex = sex; }
}
