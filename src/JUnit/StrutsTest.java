package JUnit;

import Action.UserAction;
import Bean.Topic;
import Bean.User;
import Service.TopicService;
import Service.UserService;
import Util.TopicBean;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class StrutsTest {
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "topicService")
    private TopicService topicService;

    @Test
    public void serviceTest() {
        Boolean flag = userService.checkUser("xc");
        System.out.println(flag);
    }

    @Test
    public void showTopicByTypeTest() {

        //过滤一对多实体对象
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter() {
            public boolean apply(Object source, String name, Object value) {
                if (name.equals("reverts")) {
                    return true;
                } else {
                    return false;
                }
            }
        });

        TopicBean bean = topicService.showTopicByType(1, "result_show");
        List<Topic> list = bean.getList();

        String s = JSONArray.fromObject(list,config).toString();
        System.out.println(s);
    }
}
