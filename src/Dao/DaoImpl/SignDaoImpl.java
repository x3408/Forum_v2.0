package Dao.DaoImpl;

import Bean.User;
import Bean.sign;
import Dao.SignDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class SignDaoImpl extends HibernateDaoSupport implements SignDao {
    public void save(sign sign) {
        getHibernateTemplate().save(sign);
    }

    @Override
    public List<sign> getList(String uid) {
        return getHibernateTemplate().execute(new HibernateCallback<List<sign>>() {
            @Override
            public List<sign> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from sign where uid=?").setParameter(0,uid);
                List<sign> list = query.list();
                return list;
            }
        });
    }
}
