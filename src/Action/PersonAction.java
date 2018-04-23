package Action;

import Bean.Message;
import Bean.Topic;
import Bean.User;
import Service.PersonService;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.lang.System.out;

public class PersonAction extends ActionSupport implements ModelDriven<User>{
    private PersonService ps;
    private User user = new User();
    private String username;
    private String sex;
    private File photo;
    //private String photo2;
    private String headPortraitContantType;
    private String photoFileName;
    private String send_id;
    //私信内容
    private String message;
    //显示私信摘要
    private Integer page;
//    public void setPhoto2(String photo2) {
//        this.photo2 = photo2;
//    }

    public void setPs(PersonService ps) {
        this.ps = ps;
    }
    //我的文章
    public String findArticle() throws Exception {
        User user = (User) ActionContext.getContext().getSession().get("listAllData");
        List<Topic> list = ps.findArticle(user);
        String json = JSON.toJSONString(list).toString();
            out.println(json);
         ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
            ServletActionContext.getResponse().getWriter().write(json);
        return null;
    }
    //我的关注

    public String findAttention() throws Exception{

        User user = (User) ActionContext.getContext().getSession().get("listAllData");
        List<User> list1 = ps.findAttention(user);
//        String json1 =JSONArray.fromObject(list1).toString();
        JSONArray json = JSONArray.fromObject(list1);
        String str = json.toString();//把json转换为String
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(str);
        return null;
    }

    //我的粉丝
    public String findFans() throws Exception{
        User user = (User) ActionContext.getContext().getSession().get("listAllData");
        List<User> list2 = ps.findFans(user);
        String json2 = JSONArray.fromObject(list2).toString();
        out.println(json2);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json2);
        return null;
        }
        //编辑回显页面的信息
    public String findData() throws Exception{
        User user = (User) ActionContext.getContext().getSession().get("user");
        user = ps.findData(user);
        ActionContext.getContext().getSession().put("listData",user);
        return "data";
    }




    //编辑页面修改信息的更新
    public String updateData() throws Exception{
        try {
            if(user!=null){
                //处理头像
                if(photo!=null){
                    //1、保存头像到upload/user

                    //文件保存目录路径
                    String savePath = ServletActionContext.getServletContext().getRealPath("/");
                    savePath += "headPortrait" + "/";
                    //生成带格式的随机文件名称
                    String fileName= UUID.randomUUID().toString()+photoFileName.substring(photoFileName.lastIndexOf("."));
                    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                    String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileName;
                    File uploadFile = new File(savePath, newFileName);
                    //复制文件
                    FileUtils.copyFile(photo, uploadFile);

                    //2、设置用户头像路径
                   user.setHeadPortrait(newFileName);
                } else {
                    User oldUser = (User) ActionContext.getContext().getSession().get("listData");
                    user.setHeadPortrait(oldUser.getHeadPortrait());
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        ps.updateData(user);
        ActionContext.getContext().getSession().put("user",user);
        return "editor";
    }



    //查询关注总数的操作
    public String  findAttentionCount() throws Exception{
        User user = (User) ActionContext.getContext().getSession().get("listAllData");
        int AttentionCount = ps.findAttentionCount(user);
        String json3 = JSONArray.fromObject(AttentionCount).toString();
        out.println(json3);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json3);
       return null;
    }
    //查询粉丝总数的操作
    public String  findFansCount() throws Exception{
        User user = (User) ActionContext.getContext().getSession().get("listAllData");
        int FansCount = ps.findFansCount(user);
        String json4 = JSONArray.fromObject(FansCount).toString();
        out.println(json4);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json4);
        return null;
    }
    //个人中心的信息回显
    public String findAllData() throws Exception{
        User user = (User) ActionContext.getContext().getSession().get("user");
        User list4 = ps.findAllData(user);
        ActionContext.getContext().getSession().put("listAllData",list4);
        return "list";
    }

    //显示私信具体内容
    public String showMessage() throws IOException {
        User user = (User) ActionContext.getContext().getSession().get("user");
        if (user == null) {
            ServletActionContext.getResponse().getWriter().write("{\"status\":\"noUser\"}");
            return null;
        }
//        String send_id = (String) ServletActionContext.getRequest().getParameter("send_id");
//        String send_id = (String) ActionContext.getContext().get("send_id");
        List<Util.Message> lists = ps.showMessage(user, send_id);
        String message = JSONArray.fromObject(lists).toString();
        System.out.println(message);
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(message);
        return null;
    }

    //显示私信摘要
    public String showMessageTitle() throws IOException {
        User user = (User) ActionContext.getContext().getSession().get("listAllData");
        if (user == null) {
            ServletActionContext.getResponse().getWriter().write("{\"status\":\"noUser\"}");
            return null;
        }
        user.setStatus(0);
        ps.updateData(user);
        List<Message> list = ps.showMessageTitleByUser(user, page);
        List<User> userList = new ArrayList<>();
        User temp = new User();
        for (int i=0;i < list.size(); i++) {
            temp.setUid(list.get(i).getSend_id());
            User send_id = ps.findAllData(temp);
            userList.add(send_id);
        }
        //过滤一对多实体对象
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter() {
            public boolean apply(Object source, String name, Object value) {
                if (name.equals("comments"))
                    return true;
                return false;
            }
        });
        String messageTitle = JSONArray.fromObject(list).toString();
        String userInfo = JSONArray.fromObject(userList,config).toString();

        String data = messageTitle.substring(0, messageTitle.length()-1) + "," + userInfo.substring(1,userInfo.length());
        System.out.println(data);
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(data);
        return null;
    }

    //发送私信
    public String addMessage() {
        //修改用户状态为1
        User user = (User) ActionContext.getContext().getSession().get("user");
        if (user == null) {
            try {
                ServletActionContext.getResponse().getWriter().write("{\"status\":\"noUser\"}");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
        ps.addMessage(user, send_id, message);

        User receiveUser = new User();
        receiveUser.setUid(send_id);
        receiveUser = ps.findAllData(receiveUser);
        receiveUser.setStatus(1);
        ps.updateData(receiveUser);

        return null;
    }

    public String checkMessageStatus() {
        User user = (User) ActionContext.getContext().getSession().get("listAllData");
        user = ps.findAllData(user);
        int msg = 0;
        if(user.getStatus() == 1) {
          msg = 1;
        }
        try {
            ServletActionContext.getResponse().getWriter().write("{\"msg\":\""+ msg +"\"}");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public User getModel() {
        return user ;
    }

    public String getHeadPortraitContantType() {
        return headPortraitContantType;
    }

    public void setHeadPortraitContantType(String headPortraitContantType) {
        this.headPortraitContantType = headPortraitContantType;
    }

    public File getPhoto() {
        return photo;
    }

    public void setPhoto(File photo) {
        this.photo = photo;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }

    public void setSend_id(String send_id) {
        this.send_id = send_id;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
