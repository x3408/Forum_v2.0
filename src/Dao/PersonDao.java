package Dao;

import Bean.Relation;
import Bean.Topic;
import Bean.User;

import java.util.List;

public interface PersonDao {
    List<Topic> findArticle();

    List<Relation> findAttention();

    List<Relation> findFans();

    List<User> findData();

    void updateData(User user);

    int findAttentionCount();

    int findFansCount();
}
