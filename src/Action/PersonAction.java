package Action;

import Bean.Relation;
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
    private String headPortraitContantType;
    private String photoFileName;


    public void setPs(PersonService ps) {
        this.ps = ps;
    }
    //我的文章
    public String findArticle() throws Exception {
        List<Topic> list = ps.findArticle();
        String json = JSON.toJSONString(list).toString();
            out.println(json);
         ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
            ServletActionContext.getResponse().getWriter().write(json);
        return null;
    }
    //我的关注

    public String findAttention() throws Exception{

        List<Relation> list1 = ps.findAttention();
        String json1 = JSONArray.fromObject(list1).toString();
        out.println(json1);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json1);
        return null;
    }
    public String findFans() throws Exception{
        List<Relation> list2 = ps.findFans();
        String json2 = JSONArray.fromObject(list2).toString();
        out.println(json2);
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
                }

            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        ps.updateData(user);
        return "editor";
    }
    public String  findAttentionCount() throws Exception{
       int AttentionCount = ps.findAttentionCount();
        String json3 = JSONArray.fromObject(AttentionCount).toString();
        out.println(json3);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json3);
       return null;
    }
    public String  findFansCount() throws Exception{
        int FansCount = ps.findFansCount();
        String json4 = JSONArray.fromObject(FansCount).toString();
        out.println(json4);
        ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().write(json4);
        return null;
    }
    public String findAllData() throws Exception{
        List<User> list4 = ps.findAllData();
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
