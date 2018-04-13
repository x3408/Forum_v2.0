package Service.ServiceImpl;

import Bean.Pagebean;
import Bean.Topic;
import Bean.User;
import Dao.PersonDao;
import Service.PersonService;
import Util.MessageBean;

import java.util.List;

public class PersonServiceImpl implements PersonService {

    private PersonDao pd;
    private MessageBean messageBean;


    public void setPd(PersonDao pd) {
        this.pd = pd;
    }
    //我的文章
    @Override
    public List<Topic> findArticle(User user) {
        List<Topic>list =pd .findArticle(user.getUid());
        return list ;
    }
    //我的关注
//    @Override
//    public List<User> findAttention(User user) {
//        List<User> list1 = pd.findAttention(user.getUid());
//        return list1;
//    }

    @Override
    public List<User> findFans(User user) {
        List<User> list2 = pd.findFans(user.getUid());
        return list2;
    }

    @Override
    public User findData(User user) {
        User list3 = pd.findData(user.getUid());
        return list3;
    }

    @Override
    public void updateData(User user) {
        pd.updateData(user);
    }

    @Override
    public int findAttentionCount(User user) {
        int AttentionCount =pd.findAttentionCount(user.getUid());
        return  AttentionCount;
    }

    @Override
    public int findFansCount(User user) {
        int FansCount =pd.findFansCount(user.getUid());
        return  FansCount;
    }

    @Override
    public User findAllData(User user) {
        User list4 = pd.findAllData(user.getUid());
        return list4;
    }

    @Override
    public List<User> findAttention(User user) {
        List <User> list1 = pd.findAttention(user.getUid());
        return list1;
    }

    public List<Util.Message> showMessage(User user, String send_id) {
        List<Util.Message> list = pd.showMessage(user.getUid(), send_id);
        return list;
    }

    @Override
    public List<Bean.Message> showMessageTitleByUser(User user, Integer page) {
        return this.messageBean.showMessageTitle(page, user).getList();
    }

    public void setMessageBean(MessageBean messageBean) {
        this.messageBean = messageBean;
    }
}
