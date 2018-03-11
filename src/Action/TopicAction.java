package Action;

import Service.TopicService;
import Util.TopicBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/*
    包括了
    1进首页之前显示文章摘要列表
    2具体点开文章显示内容
 */
public class TopicAction extends ActionSupport{
    private TopicService topicService;
    //文章类型 从网页获取
    private String type;
    //得到当前页
    private Integer page;


    //查看某一个分类的所有文章
    public String showTopicByType() {
        //找Service要文章分页对象
        TopicBean topicBean = topicService.showTopicByType(page, type);




        //或者转换成json数据发出
        ActionContext.getContext().getSession().put("topicBean", topicBean);

        //下一个资源action
        return null;
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
}
