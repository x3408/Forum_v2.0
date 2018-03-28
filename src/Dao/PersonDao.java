package Dao;

import Bean.Topic;
import Bean.User;

import java.util.List;

public interface PersonDao {
    List<Topic> findArticle(String uid);

    List<User> findAttention(String uid);

    List<User> findFans(String uid);

    User findData(String uid);

    void updateData(User user);

    int findAttentionCount(String uid);

    int findFansCount(String uid);

    User findAllData(String uid);


}
