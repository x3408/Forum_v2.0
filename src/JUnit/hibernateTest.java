package JUnit;

import Action.CommentAction;
import Bean.Topic;
import Bean.User;
import Bean.comment;
import Dao.CommentDao;
import Dao.RecommendDao;
import Dao.TopicDao;
import Dao.UserDao;
import Service.CommentService;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class hibernateTest {
    @Resource(name="RecommendDao")
    private RecommendDao rd;
    @Resource(name = "userDao")
    private UserDao userDao;
    @Resource(name = "topicDao")
    private TopicDao topicDao;


    @Test
    public void hibernate() {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();


        List list = session.createQuery("from Topic where tid = ?")
                .setParameter(0, 1)
                .list();

        System.out.println(list.size());



        transaction.commit();
    }

    @Test
    public void loginTest() {
        User byPassword = userDao.findByPassword("xc", "xc");
        System.out.println(byPassword.getUsername());
    }

    @Test
    public void addUserTest() {
        User user = new User();
        user.setUsername("123");
        user.setPassword("123");
        user.setPhoneNumber("123");

        userDao.addUser(user);
    }
    @Test
    public void Recommend() {
        List list= rd.getListRecommend();
        System.out.println(list);

    }
    @Resource(name = "CommentService")
    private CommentService cs;
    @Test
    public void comment() {
        List<comment> list = cs.getList();
        System.out.println(list);

    }

    @Test
    public void followTest() {
        userDao.follow("1", "2");
    }

    @Test
    public void checkUserExistTest() {
        User u = userDao.findUserByUsername("xc");
        System.out.println(u.getUsername());
    }

    @Test
    public void getTotalCountByTypeTest() {
        System.out.println(topicDao.getTotalCountByType("result_show"));
    }

    @Test
    public void getTopicByTypeTest() {
        List<Topic> result_show = topicDao.getTopicByType(1, 3, "result_show");
        for (Topic topic : result_show) {
            System.out.println(topic.getTime());
        }

    }

    @Test
    public void findTopicCountByUserTest() {
        Integer topicCountByUser = topicDao.findTopicCountByUser("1");
        System.out.println(topicCountByUser);
    }

    @Test
    public void findFansCountTest() {
        System.out.println(userDao.findFansCount("2"));
    }

    @Test
    public void getTopicByUserTest() {
        System.out.println(topicDao.findTopicByUser("1").get(0).getContent());
    }

    @Test
    public void addTopicTest() {
        Topic topic = new Topic();
        topic.setTitle("test");
        topic.setContent("test");
        topic.setUid("1");
        topic.setTime(new Date());
        topicDao.addTopic(topic);
    }
}
