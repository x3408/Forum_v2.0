package JUnit;

import Bean.User;
import Dao.UserDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class hibernateTest {
    @Resource(name = "userDao")
    private UserDao dao;
    @Test
    public void hibernate() {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();


        List list = session.createQuery("from Reverts where rid = ?")
                .setParameter(0, 1)
                .list();

        System.out.println(list.size());



        transaction.commit();
    }

    @Test
    public void loginTest() {
        User byPassword = dao.findByPassword("xc", "xc");
        System.out.println(byPassword.getUsername());
    }

    @Test
    public void addUserTest() {
        User user = new User();
        user.setUsername("123");
        user.setPassword("123");
        user.setAccountName("123");

        dao.addUser(user);
    }
}
