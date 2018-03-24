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
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class SearchAction extends ActionSupport {
    //搜索关键词
    private String keyword;
    //搜索页
    private Integer page;

    private TopicService topicService;
    private UserService userService;


    public String search() throws UnsupportedEncodingException {
        keyword = new String(keyword.getBytes("iso-8859-1"), "UTF-8");
        UserBean userBean = userService.findUserByKeyword(keyword, page);
        TopicBean topicBean = topicService.findTopicByKeyword(keyword, page);
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        ActionContext.getContext().put("userBean", userBean);
        ActionContext.getContext().put("userListBySearch", userBean.getList());
        ActionContext.getContext().put("topicBean", topicBean);
        ActionContext.getContext().put("topicListBySearch", topicBean.getList());

        return "search";
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
