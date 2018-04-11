package Action;

import Bean.Topic;
import Bean.User;
import Service.TopicService;
import Service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;
import java.util.Random;

public class UserAction extends ActionSupport implements ModelDriven<User>{
    private User user = new User();
    //注册时的用户输入的验证码
    private String verifyCodeFromUser;
    //查看某个用户时的用户id
    private String showUserId;
    //验证用户是否已经注册
    private String checkname;

    private UserService userService;
    private TopicService topicService;

    private static final String VERIFY_CODE = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static Random random = new Random();

    //用户登陆--xc
    public String login() {
        if (user.getUsername() != null) {
            User existUser = userService.login(user);
            if(existUser != null) {
                ActionContext.getContext().getSession().put("user", existUser);
                //重定向到首页
                return "toIndex";
            }
        }
        //或者可以采用转发到login页面 ActionContext.getContext().put("msg", "用户名或密码不正确");
        ActionContext.getContext().put("msg", "用户名或密码不正确");
        return "login";
    }

    //注册用户--xc
    public String add() {
        String rightCode = (String) ActionContext.getContext().getSession().get("checkcode");
        rightCode = rightCode.toUpperCase();
        if (!rightCode.equals(verifyCodeFromUser.toUpperCase())) {
            ActionContext.getContext().put("msg","验证码不正确");
            return "regist";
        }
         userService.add(user);

        ActionContext.getContext().getSession().put("user", user);
        return "toIndex";
    }

    //查看用户--xc
    public String showUser() {
        User user = userService.findUserById(showUserId);

        ActionContext.getContext().getSession().put("listAllData", user);

        return "showUser";
    }

    //关注该用户--xc
    public String follow() {
        //查看该用户登录状态
        User user = (User) ActionContext.getContext().getSession().get("user");
        User topicUser = (User) ActionContext.getContext().getSession().get("topicUser");
        PrintWriter writer = null;
        try {
            writer = ServletActionContext.getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //未登陆跳转login
        if (user == null) {
            /*ActionContext.getContext().put("msg", "请登录后再尝试该操作");
            //这里有问题   不能跳转回想要关注的用户界面中  只能回首页从而丢失关注对象(暂且跳转至首页)
            return "login";*/
            writer.write("{\"status\":\"noUser\"}");
            return null;
        }
//        已登陆关注

        //获取关注用户id,使用set注入获取

        //调用service方法
        userService.follow(user,topicUser.getUid());
        writer.write("{\"status\":\"success\"}");
        return null;
    }

    //取消关注用户
    public String unFollow() {
        //查看该用户登录状态
        User user = (User) ActionContext.getContext().getSession().get("user");
        User topicUser = (User) ActionContext.getContext().getSession().get("topicUser");

        PrintWriter writer = null;
        try {
            writer = ServletActionContext.getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //未登陆跳转login
        if (user == null) {
           /* ActionContext.getContext().put("msg", "请登录后再尝试该操作");
            //这里有问题   不能跳转回想要关注的用户界面中  只能回首页从而丢失关注对象(暂且跳转至首页)
            return "login";*/

            writer.write("{\"status\":\"noUser\"}");
            return null;
        }
//        已登陆关注

        //获取关注用户id,使用set注入获取

        //调用service方法
        userService.unFollow(user,topicUser.getUid());
        writer.write("{\"status\":\"success\"}");
        return null;
    }

    //查看某个用户是否已经关注了该用户
    public String checkStatus() {
        User user = (User) ActionContext.getContext().getSession().get("user");
        User topicUser = (User) ActionContext.getContext().getSession().get("topicUser");
        Boolean flag = false;
        if (user != null) {
            flag = userService.checkStatus(user.getUid(), topicUser.getUid());
        }
        PrintWriter writer = null;
        try {
            writer = ServletActionContext.getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (flag) {
            writer.write("{\"status\":\"follow\"}");
        } else {
            writer.write("{\"status\":\"unFollow\"}");
        }

        return null;
    }

    //注册页面查看用户是否已经存在--xc
    public String checkUser() {
        boolean flag = userService.checkUser(checkname);

        try {
            ServletActionContext.getResponse().getWriter().write("{\"isExist\":"+flag+"}\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    //查看一个用户所有文章列表--xc
    public String showUserAllTopic() {
        //调用service得到Topic集合
        List<Topic> list = topicService.findTopicByUser(showUserId);

        //回写方法

        //action跳转
        return "userTopic";
    }

    //用户注销
    public String logout() {
        ServletActionContext.getRequest().getSession().invalidate();
        return "toIndex";
    }


    //注册页面生成验证码--xc
    public String verifyImg() {
        ServletOutputStream outputStream = null;
        try {
            outputStream = ServletActionContext.getResponse().getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        int width=110,height=40;
        String VerifyCode = setVerifyCode(4);
        try {
            createImage(width,height,outputStream,VerifyCode);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
    public static String setVerifyCode(int CodeSize){
        return setVerifyCode(CodeSize,VERIFY_CODE);
    }
    public static String setVerifyCode(int codeSize,String source){		//从VERIFY_CODE中随机获得一个字符串
        char [] cha = new char[codeSize];
        for(int i = 0;i<codeSize;i++){
            cha [i] = source.charAt(random.nextInt(VERIFY_CODE.length()));
        }
        String code = String.valueOf(cha);
        //生成的验证码存放在session域中
        ActionContext.getContext().getSession().put("checkcode", code);
        return code;
    }
    private static void createImage(int width, int height, OutputStream os, String verifyCode) throws IOException{
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D g = image.createGraphics();

        g.setColor(Color.GRAY);				//设置背景色
        g.fillRect(0, 0, width, height);

        Color c = getRandColor(200,250);
        g.setColor(c);
        g.fillRect(0,2,width,height-2);

        g.setColor(getRandColor(160,200));			//设置前景色
        for(int i=0;i<20;i++){
            int x = random.nextInt(width - 1);
            int y = random.nextInt(height - 1);
            int x1 = random.nextInt(6) + 1;
            int y1 = random.nextInt(12)+1;

            g.drawLine(x, y, x + x1 + 40, y + y1 + 20);
        }

        shear(g,width,height,c);			//将背景变形

        g.setColor(getRandColor(100,160));				//设置字体与颜色
        int fontSize = height-4;
        Font font = new Font("Algerian",Font.ITALIC,fontSize);
        g.setFont(font);
        char [] target = verifyCode.toCharArray();
        for(int i=0;i<verifyCode.length();i++){	//绘画字字母

            AffineTransform affine = new AffineTransform();
            int x = ((width-10) / verifyCode.length()) * i + 5;
            int y = height/2 + fontSize/2 - 10;
            affine.setToRotation(Math.PI / 4 * random.nextDouble() * (random.nextBoolean() ? 1 : -1), (width / verifyCode.length()) * i + fontSize/2, height/2);
            //setToRotation(旋转角度，旋转点x，旋转点坐标y)

            g.setTransform(affine);
            g.drawChars(target, i,1 , x, y);	//要画的字符数组，从第几个开始，每次画几个，坐标x，坐标y
        }

        g.dispose();			//释放系统资源
        ImageIO.write(image,"jpg", os);
    }
    private static Color getRandColor(int x,int y){
        int r = random.nextInt(y-x)+x;
        int g = random.nextInt(y-x)+x;
        int b = random.nextInt(y-x)+x;

        return new Color(r,g,b);
    }
    private static void shear(Graphics g, int w1, int h1, Color color) {
        shearX(g, w1, h1, color);
        shearY(g, w1, h1, color);
    }
    private static void shearX(Graphics g, int w1, int h1, Color color) {
        int period = random.nextInt(2);
        int frames = 1;
        int phase = random.nextInt(2);
        for (int i = 0; i < h1; i++) {
            double d = (double) (period >> 1)
                    * Math.sin((double) i / (double) period
                    + (6.2831853071795862D * (double) phase)
                    / (double) frames);
            g.copyArea(0, i, w1, 1, (int) d, 0);
            g.setColor(color);
            g.drawLine((int) d, i, 0, i);
            g.drawLine((int) d + w1, i, w1, i);
        }
    }
    private static void shearY(Graphics g, int w1, int h1, Color color) {
        int period = random.nextInt(40) + 10; // 50;
        int frames = 20;
        int phase = 7;
        for (int i = 0; i < w1; i++) {
            double d = (double) (period >> 1)
                    * Math.sin((double) i / (double) period
                    + (6.2831853071795862D * (double) phase)
                    / (double) frames);
            g.copyArea(i, 0, 1, h1, 0, (int) d);

            g.setColor(color);
            g.drawLine(i, (int) d, i, 0);
            g.drawLine(i, (int) d + h1, i, h1);
        }
    }





    @Override
    public User getModel() {
        return user;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getVerifyCodeFromUser() {
        return verifyCodeFromUser;
    }

    public void setVerifyCodeFromUser(String verifyCodeFromUser) {
        this.verifyCodeFromUser = verifyCodeFromUser;
    }

    public String getShowUserId() {
        return showUserId;
    }

    public void setShowUserId(String showUserId) {
        this.showUserId = showUserId;
    }

    public void setCheckname(String checkname) {
        this.checkname = checkname;
    }

    public String getCheckname() {
        return this.checkname;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }
}
