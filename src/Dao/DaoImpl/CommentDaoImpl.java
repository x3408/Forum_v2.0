package Dao.DaoImpl;

import Bean.Topic;
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
    private Topic t;
    public void save(comment comment) {
        if(comment.getTid()<1000) {
            u= getHibernateTemplate().execute(new HibernateCallback<User>() {
                public User doInHibernate(Session session) throws HibernateException {
                    String hql = "from User where uid = ? ";
                    Query query = session.createQuery(hql);
                    query.setParameter(0, comment.getUid());
                    User user = (User) query.uniqueResult();
                    return user;
                }
            });
            t= getHibernateTemplate().execute(new HibernateCallback<Topic>() {
                public Topic doInHibernate(Session session) throws HibernateException {
                    String hql = "from Topic where tid = ? ";
                    Query query = session.createQuery(hql);
                    query.setParameter(0, comment.getTid());
                    Topic topic = (Topic) query.uniqueResult();
                    return topic;
                }
            });
            t.getComments().add(comment);
            comment.setTopic(t);

            u.getComments().add(comment);
            comment.setUser(u);

            getHibernateTemplate().saveOrUpdate(comment);

        }else{
            getHibernateTemplate().saveOrUpdate(comment);
        }



    }

    @Override
    public List<comment> getList(Integer tid) {
        return getHibernateTemplate().execute(new HibernateCallback<List<comment>>() {
            @Override
            public List<comment> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from comment where tid=?").setParameter(0,tid);
                List<comment> list = query.list();
                return list;
            }
        });
    }
}
