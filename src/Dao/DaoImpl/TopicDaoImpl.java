package Dao.DaoImpl;

import Bean.Topic;
import Dao.TopicDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class TopicDaoImpl extends HibernateDaoSupport implements TopicDao {
    @Override
    public Integer getTotalCountByType(String type) {
        //Criteria
        DetachedCriteria dc = DetachedCriteria.forClass(Topic.class)
                .setProjection(Projections.rowCount())
                .add(Restrictions.eq("type", type));

        Long aLong = (Long) getHibernateTemplate().findByCriteria(dc).get(0);
        return aLong.intValue();

    }

    @Override
    public List<Topic> getTopicByType(int start, Integer limit, String type) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Topic>>() {
            @Override
            public List<Topic> doInHibernate(Session session) throws HibernateException {
                List list =  session.createQuery("from Topic where type = ?")
                        .setParameter(0, type)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }
}
