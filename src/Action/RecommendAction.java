package Action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Bean.recommend;
import Service.RecommendService;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;

public class RecommendAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private RecommendService rs;
    
	public void setRs(RecommendService rs) {
		this.rs = rs;
	}

	public String list() throws Exception {
		// TODO 自动生成的方法存根
		//调用RecommendService层方法 返回List<Recommend>对象
		 List<recommend> list= rs.getListRecommend();
		String json = JSONArray.fromObject(list).toString();
		System.out.println(json);
		ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		//将对象存入测试页面 并重定向

		return null;
	}

	
}
