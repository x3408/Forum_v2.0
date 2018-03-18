package Dao.DaoImpl;

import Bean.User;
import Bean.comment;
import Dao.CommentDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao{
    private User u;
    public void save(comment comment) {
         u= getHibernateTemplate().execute(new HibernateCallback<User>() {
            public User doInHibernate(Session session) throws HibernateException {
                String hql = "from User where uid = ? ";
                Query query = session.createQuery(hql);
                query.setParameter(0, comment.getUid());
                User user = (User) query.uniqueResult();
                return user;
            }
        });
        u.getComments().add(comment);
        comment.setUser(u);

        getHibernateTemplate().saveOrUpdate(comment);

    }

    @Override
    public List<comment> getList() {
        return getHibernateTemplate().execute(new HibernateCallback<List<comment>>() {
            @Override
            public List<comment> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from comment");
                List<comment> list = query.list();
                return list;
            }
        });
    }
}
