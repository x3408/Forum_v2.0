package Dao;

import Bean.Message;
import Bean.Topic;
import Bean.User;

import java.util.List;

public interface PersonDao {
    List<Topic> findArticle(String uid);

    List<User> findFans(String uid);

    User findData(String uid);

    void updateData(User user);

    int findAttentionCount(String uid);

    int findFansCount(String uid);

    User findAllData(String uid);

    List<Util.Message> showMessage(String uid, String send_id);

    List<User> findAttention(String uid);
    List<Message> getMessageTitleByUser(int start, Integer limit, String uid);
}

