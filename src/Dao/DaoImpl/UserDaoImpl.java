package Dao.DaoImpl;

import Bean.User;
import Dao.UserDao;
import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import javax.servlet.Servlet;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Override
    public User findByPassword(String username, String password) {
        return getHibernateTemplate().execute(new HibernateCallback<User>() {
            @Override
            public User doInHibernate(Session session) throws HibernateException {
                String sql = "from User where username = ? and password = ?";
                User user_sql = (User) session.createQuery(sql)
                        .setParameter(0, username)
                        .setParameter(1, password)
                        .uniqueResult();
                return user_sql;
            }
        });
    }

    @Override
    public void addUser(User user) {
        getHibernateTemplate().save(user);
    }
}
