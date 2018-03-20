package Dao.DaoImpl;

import Bean.Relation;
import Bean.Topic;
import Bean.User;
import Dao.PersonDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class PersonDaoImpl extends HibernateDaoSupport implements PersonDao {
    //我的文章
    @Override
    public List<Topic> findArticle() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Topic>>() {

            @Override
            public List<Topic> doInHibernate(Session session ) throws HibernateException {
                String hql= "from Topic" ;//这里的表名不能直接填写表名，而是填写该表在orm元数据中的映射关系名字
                Query query = session.createQuery(hql);
                List<Topic> list =query.list();
                return list;
            }
        });

    }
    //我的关注
    @Override
    public List<Relation> findAttention() {
       return getHibernateTemplate().execute(new HibernateCallback<List<Relation>>() {
            @Override
            public List<Relation> doInHibernate(Session session) throws HibernateException {
                String hql= "from Relation where uid='3' and type=1" ;//这里的表名不能直接填写表名，而是填写该表在orm元数据中的映射关系名字
                Query query = session.createQuery(hql);
                List<Relation> list1 =query.list();
                return list1;
            }
        });
    }

    @Override
    public List<Relation> findFans() {
        return getHibernateTemplate().execute(new HibernateCallback<List<Relation>>() {
            @Override
            public List<Relation> doInHibernate(Session session) throws HibernateException {
                String hql = "from Relation where uid='3' and type=2";//这里的表名不能直接填写表名，而是填写该表在orm元数据中的映射关系名字
                Query query = session.createQuery(hql);
                List<Relation> list2 = query.list();
                return list2;
            }
        });
    }

    @Override
    public List<User> findData() {
        return getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
            @Override
            public List<User> doInHibernate(Session session) throws HibernateException {
                String hql = "from User ";//这里的表名不能直接填写表名，而是填写该表在orm元数据中的映射关系名字
                Query query = session.createQuery(hql);
                List<User> list3 = query.list();
                return list3;
            }
        });
    }

    @Override
    public void updateData(User user) {
        User OldUser = getHibernateTemplate().get(User.class,"1");
        OldUser.setUsername(user.getUsername());
        OldUser.setSex(user.getSex());
        getHibernateTemplate().update(OldUser);
    }

    @Override
    public int findAttentionCount() {
       return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

           @Override
           public Integer doInHibernate(Session session) throws HibernateException {
               String hql = "select count(*)  from Relation where uid='3'and type=2 ";
               Query query = session.createQuery(hql);
               int AttentionCount = ((Long) query.iterate().next()).intValue();
               return AttentionCount;
           }
       });
    }

    @Override
    public int findFansCount() {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql = "select count(*)  from Relation where uid='3'and type=1 ";
                Query query = session.createQuery(hql);
                int FansCount = ((Long) query.iterate().next()).intValue();
                return FansCount;
            }
        });
    }


}
