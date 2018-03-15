package Dao.DaoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import Bean.recommend;
import Dao.RecommendDao;

public class RecommendDaoImpl extends HibernateDaoSupport implements RecommendDao{

	@Override
	public List<recommend> getListRecommend() {
		// TODO 自动生成的方法存根
	     return getHibernateTemplate().execute(new HibernateCallback<List<recommend>>() {
	            @Override
	            public List<recommend> doInHibernate(Session session) throws HibernateException {
	            	 Query query = session.createQuery("from recommend");  
	            	    List<recommend> list = query.list();  
	                return list;
	            }
	        });
	}


	





}
