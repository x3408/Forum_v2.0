package Action;

import Bean.Topic;
import Bean.User;
import Service.TopicService;
import Service.UserService;
import Util.TopicBean;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.util.List;

/*
    包括了
    1进首页之前显示文章摘要列表
    2具体点开文章显示内容
 */
public class TopicAction extends ActionSupport implements ModelDriven<Topic>{
    private Topic topic = new Topic();
    private TopicService topicService;
    //文章类型 从网页获取
    private String type;
    //得到当前页
    private Integer page;

    //UserService方便获取用户信息
    private UserService userService;


    //查看某一个分类的所有文章--xc
    public String showTopicByType() throws IOException {
        //过滤一对多实体对象
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter() {
                                         public boolean apply(Object source, String name, Object value) {
                                             if (name.equals("reverts"))
                                                 return true;
                                             return false;
                                         }
                                     });

        //找Service要文章分页对象
        TopicBean topicBean = topicService.showTopicByType(page, type);

        //json格式回写
        List<Topic> list = topicBean.getList();
        User userById = userService.findUserById(list.get(0).getUid().toString());

        String s1 = JSONArray.fromObject(list,config).toString();
        String s2 = JSONArray.fromObject(userById).toString();

        String data = s1.substring(0, s1.length()-1) + "," + s2.substring(1,s2.length());

        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(data);


        //放置在session域
        ActionContext.getContext().getSession().put("topicBean", topicBean);

        //下一个资源action
        return null;
    }

    //发表文章--xc
    public String addTopic() {
        //获取发表文章的用户
        User user = (User) ActionContext.getContext().getSession().get("user");

        //设置文章发布类型
        topic.setType(type);

        //使用判断的形式
        boolean flag = topicService.addTopic(topic, user);


        if (!flag) {
            //不成功 设置错误信息 返回发布文章页显示信息
            ActionContext.getContext().put("msg", "抱歉! 发布文章失败,请稍后重试!");
            return "addTopic";
        }
        //成功 回首页
        return "toIndex";
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPage() {
        return page;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public Topic getModel() {
        return topic;
    }
}
