package Action;

import Bean.Topic;
import Bean.User;
import Service.PersonService;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

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
        out.println(str);
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
            // TODO Auto-generated catch block
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
}
