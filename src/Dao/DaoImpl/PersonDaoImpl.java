package Dao.DaoImpl;

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
    public List<Topic> findArticle(String uid) {
        return getHibernateTemplate().execute(new HibernateCallback<List<Topic>>() {

            @Override
            public List<Topic> doInHibernate(Session session) throws HibernateException {
                String hql = "from Topic where uid = ?";//这里的表名不能直接填写表名，而是填写该表在orm元数据中的映射关系名字
                Query query = session.createQuery(hql)
                        .setParameter(0, uid);
                List<Topic> list = query.list();
                return list;
            }
        });

    }

    //我的关注
    @Override
    public List<User> findAttention(String uid) {
        return getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
            @Override
            public List<User> doInHibernate(Session session) throws HibernateException {
               String hql = " select username,headPortrait,uid from user where uid in (select follow_uid from relation where uid = ? and type = ?)";//这里的表名不能直接填写表名，而是填写该表在orm元数据中的映射关系名字
                Query query = session.createSQLQuery(hql)
                        .setParameter(0, uid)
                        .setParameter(1, 1);
                List<User> list1 = query.list();
                return list1;
            }
        });
    }

    @Override
    public List<User> findFans(String uid) {
        return getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
            @Override
            public List<User > doInHibernate(Session session) throws HibernateException {
                String hql = "select username,headPortrait,uid from User where uid in (select follow_uid from Relation where uid = ? and type = ?)";//这里的表名不能直接填写表名，而是填写该表在orm元数据中的映射关系名字
                Query query = session.createSQLQuery(hql)
                        .setParameter(0, uid)
                        .setParameter(1, 2);
                List<User > list2 = query.list();
                return list2;
            }
        });
    }

    @Override
    public User findData(String uid) {
        return getHibernateTemplate().get(User.class, uid);
    }
    //更改信息
    @Override
    public void updateData(User user) {
        //测试使用代码
//        user.setUid("5e43f570624c9d6c01624c9df37f0000");
        /*User OldUser = getHibernateTemplate().get(User.class, "5e43f570624c9d6c01624c9df37f0000");
        OldUser.setUsername(user.getUsername());
        OldUser.setSex(user.getSex());

        OldUser.setSignature(user.getSignature());*/
        getHibernateTemplate().update(user);
    }

    @Override
    public int findAttentionCount(String uid) {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql = "select count(*)  from Relation where uid= ? and type=1 ";
                Query query = session.createQuery(hql)
                        .setParameter(0, uid);
                int AttentionCount = ((Long) query.iterate().next()).intValue();
                return AttentionCount;
            }
        });
    }

    @Override
    public int findFansCount(String uid) {
        return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                String hql = "select count(*)  from Relation where uid=?and type=2 ";
                Query query = session.createQuery(hql)
                        .setParameter(0, uid);
                int FansCount = ((Long) query.iterate().next()).intValue();
                return FansCount;
            }
        });
    }
    //查询信息发布
    @Override
    public User findAllData(String uid) {
       /*return getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
            @Override
            public List<User> doInHibernate(Session session) throws HibernateException {
                session.get(User)
                return list4;
            }
        });*/
        return getHibernateTemplate().get(User.class, uid);
    }



}