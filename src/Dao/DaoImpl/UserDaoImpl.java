package Dao.DaoImpl;

import Bean.User;
import Dao.UserDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Override
    public User findByPassword(String username, String password) {
        /*return getHibernateTemplate().execute(new HibernateCallback<User>() {
            @Override
            public User doInHibernate(Session session) throws HibernateException {
                String sql = "from User where username = ? and password = ?";
                User user_sql = (User) session.createQuery(sql)
                        .setParameter(0, username)
                        .setParameter(1, password)
                        .uniqueResult();
                return user_sql;
            }
        });*/

        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();


        List list = session.createQuery("from User where username = ? and password = ?")
                .setParameter(0, username)
                .setParameter(1, password)
                .list();

        System.out.println(list.size());



        transaction.commit();

        return list.get(0)
    }
}
