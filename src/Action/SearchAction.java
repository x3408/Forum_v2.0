package Action;

import Bean.Topic;
import Bean.User;
import Service.TopicService;
import Service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class SearchAction extends ActionSupport {
    //搜索关键词
    private String keyword;
    //搜索类型
    private String type;

    private TopicService topicService;
    private UserService userService;


    public String search() {
        switch (type) {
            case "title":
                return searchTopic(keyword);
            case "user":
                return searchUser(keyword);
            //防止以后有新类型搜索 所以使用switch语句
        }
        return null;
    }

    private String searchUser(String keyword) {
        List<User> userList = userService.findUserByKeyword(keyword);

        ActionContext.getContext().put("userListBySearch", userList);
        return "search";
    }

    //搜索文章
    private String searchTopic(String keyword) {
        List<Topic> topicList = topicService.findTopicByKeyword(keyword);

        ActionContext.getContext().put("topicListBySearch", topicList);
        return "search";
    }


    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
