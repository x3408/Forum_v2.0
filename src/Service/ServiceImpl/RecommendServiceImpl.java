package Service.ServiceImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import Bean.recommend;
import Dao.RecommendDao;
import Service.RecommendService;

public class RecommendServiceImpl implements RecommendService{
     private RecommendDao rd;
     
	public void setRd(RecommendDao rd) {
		this.rd = rd;
	}

	@Override
	public List<recommend> getListRecommend() {
		// TODO 自动生成的方法存根
		//向Dao层继续调用方法 返回List对象
		List<recommend> list=rd.getListRecommend();
		return list;
	}

	

}
