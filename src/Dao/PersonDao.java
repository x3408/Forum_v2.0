package Dao;

import Bean.Relation;
import Bean.Topic;
import Bean.User;

import java.util.List;

public interface PersonDao {
    List<Topic> findArticle(String uid);

    List<Relation> findAttention(String uid);

    List<Relation> findFans(String uid);

    User findData(String uid);

    void updateData(User user);

    int findAttentionCount(String uid);

    int findFansCount(String uid);

    User findAllData(String uid);


}
