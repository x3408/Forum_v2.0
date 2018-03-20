package Action;

import Bean.Relation;
import Bean.Topic;
import Bean.User;
import Service.PersonService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

import java.util.List;
import java.util.Map;

public class PersonAction extends ActionSupport implements ModelDriven<User>{
    private PersonService ps;
    private User user = new User();
    private String username;
    private String sex;

    public void setPs(PersonService ps) {
        this.ps = ps;
    }
    //我的文章
    public String findArticle() throws Exception {
        List<Topic> list = ps.findArticle();
        String json = JSONArray.fromObject(list).toString();
            System.out.println(json);
         ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
            ServletActionContext.getResponse().getWriter().write(json);
        return null;
    }
    //我的关注

    public String findAttention() throws Exception{

        List<Relation> list1 = ps.findAttention();
        String json1 = JSONArray.fromObject(list1).toString();
        System.out.println(json1);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json1);
        return null;
    }
    public String findFans() throws Exception{
        List<Relation> list2 = ps.findFans();
        String json2 = JSONArray.fromObject(list2).toString();
        System.out.println(json2);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json2);
        return null;
        }
    public String findData() throws Exception{
        List<User> list3 = ps.findData();
        ActionContext.getContext().getSession().put("listData",list3);
        return "data";
    }
    public String updateData() throws Exception{
         ps.updateData(user);
        return "editor";
    }
    public String  findAttentionCount() throws Exception{
       int AttentionCount = ps.findAttentionCount();
        String json3 = JSONArray.fromObject(AttentionCount).toString();
        System.out.println(json3);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json3);
       return null;
    }
    public String  findFansCount() throws Exception{
        int FansCount = ps.findFansCount();
        String json4 = JSONArray.fromObject(FansCount).toString();
        System.out.println(json4);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json4);
        return null;
    }
    @Override
    public User getModel() {
        return user ;
    }
}
