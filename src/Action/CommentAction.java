package Action;

import Bean.comment;
import Service.CommentService;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.List;

public class CommentAction extends ActionSupport {
    //这是评论保存到数据库的Action
    private CommentService cs;
    private comment comment=new comment();

    public void setCs(CommentService cs) {
        this.cs = cs;
    }

    public String save() throws Exception {
        ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
        comment.setUid(uid);
        comment.setComment_content(comment_content);
        comment.setUid_name(replyName);
        comment.setTid(tid);
        //得到参数 传递给Service 调用save 方法
        cs.save(comment);
        return null;
    }
    public String list() throws Exception {
        String tid1 = ServletActionContext.getRequest().getParameter("tid");
        Integer tid = Integer.parseInt(tid1);

        //向service要list
        List<comment> list=cs.getList(tid);
        String json = JSON.toJSONString(list).toString();

        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json);
        return null;
    }





    private String replyName;
    private String comment_content;
    private String uid;
    private Integer tid;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getReplyName() {
        return replyName;
    }

    public void setReplyName(String replyName) {
        this.replyName = replyName;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
}
