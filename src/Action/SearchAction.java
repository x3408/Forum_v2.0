package Action;

import Bean.Topic;
import Bean.User;
import Service.TopicService;
import Service.UserService;
import Util.TopicBean;
import Util.UserBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class SearchAction extends ActionSupport {
    //搜索关键词
    private String keyword;
    //搜索页
    private Integer page;

    private TopicService topicService;
    private UserService userService;


    public String search() throws UnsupportedEncodingException {
        /*keyword = new String(keyword.getBytes("iso-8859-1"), "UTF-8");
        UserBean userBean = userService.findUserByKeyword(keyword, page);
        TopicBean topicBean = topicService.findTopicByKeyword(keyword, page);
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        ActionContext.getContext().put("userBean", userBean);
        ActionContext.getContext().put("userListBySearch", userBean.getList());
        ActionContext.getContext().put("topicBean", topicBean);
        ActionContext.getContext().put("topicListBySearch", topicBean.getList());

        return "search";*/

        //过滤一对多实体对象
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter() {
            public boolean apply(Object source, String name, Object value) {
                if (name.equals("comments"))
                    return true;
                return false;
            }
        });
        TopicBean topicBean = topicService.findTopicByKeyword(keyword, page);

        //json格式回写
        List<Topic> list = topicBean.getList();
        List<User> userList = new ArrayList<>();
        for (int i=0;i < list.size(); i++) {
            User user = userService.findUserById(list.get(i).getUid().toString());
            userList.add(user);
        }

        String s1 = JSONArray.fromObject(list,config).toString();
        String s2 = JSONArray.fromObject(userList,config).toString();

        String data = s1.substring(0, s1.length()-1) + "," + s2.substring(1,s2.length());

        System.out.println(data);

        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        try {
            ServletActionContext.getResponse().getWriter().write(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}
