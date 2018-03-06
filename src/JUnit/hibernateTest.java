package JUnit;

import Bean.Topic;
import Bean.User;
import Dao.DaoImpl.UserDaoImpl;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

public class hibernateTest {
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
        UserDaoImpl dao = new UserDaoImpl();
        User byPassword = dao.findByPassword("xc", "xc");
        System.out.println(byPassword.getUsername());
    }
}
