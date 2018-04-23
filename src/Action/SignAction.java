package Action;

import Bean.User;
import Bean.sign;
import Service.SignService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.ServletContext;
import java.util.List;

public class SignAction extends ActionSupport{
    private SignService ss;
    private sign sign=new sign();

    public void setSs(SignService ss) {
        this.ss = ss;
    }

    private String day;

    public String save() throws Exception {
        User user = (User) ActionContext.getContext().getSession().get("user");
        String uid = user.getUid();
        sign.setUid(uid);
        sign.setContent(day);
        ss.save(sign);
        return null;
    }
    public String get() throws Exception {
        // var arr=[{"signDay":"2"},{"signDay":"28"}];
        User user = (User) ActionContext.getContext().getSession().get("user");
        String uid = user.getUid();
        List<sign> list=ss.getList(uid);
        if(list.size()==0){
            ServletActionContext.getResponse().getWriter().write("[{\"signDay\":\"1\"}]");
        }else{
        String arr="";
        for(int i=0;i<list.size();i++){
            if(i==0){
                arr+="[{\"signDay\":";
                arr+="\""+list.get(i).getContent()+"\"";
                arr+="},";
            }
            if(i>0&&i< list.size()-1){
                arr+="{\"signDay\":";
                arr+="\""+list.get(i).getContent()+"\"";
                arr+="},";
            }
            if(i==list.size()-1){
                arr+="{\"signDay\":";
                arr+="\""+list.get(i).getContent()+"\"";
                arr+="}]";
            }
            arr.trim();
        }
        ServletActionContext.getResponse().getWriter().write(arr);}
        return null;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }
}
