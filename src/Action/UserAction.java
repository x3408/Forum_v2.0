package Action;

import Bean.User;
import Service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{
    private User user;

    private UserService userService;

    //用户登陆
    public String login() {
        if (user.getUsername() != null) {
            User existUser = userService.login(user);

            ActionContext.getContext().getSession().put("user", existUser);

            //重定向到首页
            return "toIndex";
        }
        //或者可以采用转发到login页面 ActionContext.getContext().put("msg", "用户名或密码不正确");
        ActionContext.getContext().put("msg", "用户名或密码不正确");
        return "login";
    }

    //注册用户
    public String add() {
        userService.add(user);

        ActionContext.getContext().getSession().put("user", user);
        return "toIndex";
    }

    //查看用户
    public String showUser() {
        return null;
    }

    //关注该用户
    public String follow() {
        return null;
    }


    public show

    @Override
    public User getModel() {
        return user;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
