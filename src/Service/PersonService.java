package Service;

import Bean.Topic;
import Bean.User;
import Util.Message;

import java.util.List;

public interface PersonService {
    List<Topic> findArticle(User user);

    List<User> findAttention(User user);

    List<User> findFans(User user);

    User findData(User user);

    void updateData(User user);

    int findAttentionCount(User user);

    int findFansCount(User user);


    User findAllData(User user);

    List<Message> showMessage(User user, String send_id);
}
