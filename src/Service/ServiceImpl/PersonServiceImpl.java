package Service.ServiceImpl;

import Bean.Relation;
import Bean.Topic;
import Bean.User;
import Dao.PersonDao;
import Service.PersonService;

import java.util.List;

public class PersonServiceImpl implements PersonService {

    private PersonDao pd;
    public void setPd(PersonDao pd) {
        this.pd = pd;
    }
    //我的文章
    @Override
    public List<Topic> findArticle() {
        List<Topic>list =pd .findArticle();
        return list ;
    }
    //我的关注
    @Override
    public List<Relation> findAttention() {
        List<Relation> list1 = pd.findAttention();
        return list1;
    }

    @Override
    public List<Relation> findFans() {
        List<Relation> list2 = pd.findFans();
        return list2;
    }

    @Override
    public List<User> findData() {
        List<User> list3 = pd.findData();
        return list3;
    }

    @Override
    public void updateData(User user) {
        pd.updateData(user);
    }

    @Override
    public int findAttentionCount() {
        int AttentionCount =pd.findAttentionCount();
        return  AttentionCount;
    }

    @Override
    public int findFansCount() {
        int FansCount =pd.findFansCount();
        return  FansCount;
    }

}
