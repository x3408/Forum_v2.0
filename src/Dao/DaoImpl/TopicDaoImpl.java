package Dao.DaoImpl;

import Bean.Topic;
import Dao.TopicDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class TopicDaoImpl extends HibernateDaoSupport implements TopicDao {
    //按类型获取文章总数
    @Override
    public Integer getTotalCountByType(String type) {
        //Criteria
        DetachedCriteria dc = DetachedCriteria.forClass(Topic.class)
                .setProjection(Projections.rowCount())
                .add(Restrictions.eq("type", type));

        Long aLong = (Long) getHibernateTemplate().findByCriteria(dc).get(0);
        return aLong.intValue();

    }

    //按类型获取文章对象集合
    @Override
    public List<Topic> getTopicByType(int start, Integer limit, String type) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Topic>>() {
            @Override
            public List<Topic> doInHibernate(Session session) throws HibernateException {
                List list =  session.createQuery("from Topic where type = ? order by time desc ")
                        .setParameter(0, type)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    //按用户id获取文章总数
    @Override
    public Integer findTopicCountByUser(String uid) {
        DetachedCriteria dc = DetachedCriteria.forClass(Topic.class)
                .setProjection(Projections.rowCount())
                .add(Restrictions.eq("uid", uid));

        Long aLong = (Long) getHibernateTemplate().findByCriteria(dc).get(0);
        return aLong.intValue();
    }

    //按用户id获取文章列表对象
    @Override
    public List<Topic> findTopicByUser(String userId) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Topic>>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException {
                return session.createQuery("from Topic where uid = ?")
                        .setParameter(0, userId)
                        .list();
            }
        });
    }

    @Override
    public boolean addTopic(Topic topic) {
        getHibernateTemplate().saveOrUpdate(topic);
        return true;
    }

    @Override
    public List<String> findTopicTypeList() {
        return getHibernateTemplate().execute(new HibernateCallback<List<String>>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException {
                return session.createQuery("select type from Topic group by type")
                        .list();
            }
        });
    }

    @Override
    public Topic findTopicById(Integer tid) {
        return getHibernateTemplate().get(Topic.class, tid);
    }

    @Override
    public List<Topic> findTopicByKeyword(String keyword) {
         return getHibernateTemplate().execute(new HibernateCallback<List<Topic>>() {
             @Override
             public List doInHibernate(Session session) throws HibernateException {
                 return session.createQuery("from Topic where title like ?")
                         .setParameter(0, "%"+ keyword+"%")
                         .list();
             }
         });
    }

    @Override
    public Integer getTotalCountByTitle(String keyword) {
        DetachedCriteria dc = DetachedCriteria.forClass(Topic.class)
                .setProjection(Projections.rowCount())
                .add(Restrictions.like("title", "%"+keyword+"%"));
        Long aLong = (Long) getHibernateTemplate().findByCriteria(dc).get(0);
        return aLong.intValue();
    }

    @Override
    public List<Topic> getTopicByTitle(int start, Integer limit, String keyword) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Topic>>() {
            @Override
            public List<Topic> doInHibernate(Session session) throws HibernateException {
                List list =  session.createQuery("from Topic where title like ? order by time desc ")
                        .setParameter(0, "%"+keyword+"%")
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }
}
