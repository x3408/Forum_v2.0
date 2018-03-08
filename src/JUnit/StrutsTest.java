package JUnit;

import Action.UserAction;
import Bean.User;
import Service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class StrutsTest {
    @Resource(name = "userService")
    private UserService userService;


    @Test
    public void serviceTest() {
        User u = new User();
        u.setUsername("xc");
        u.setPassword("xc");
        User login = userService.login(u);
        System.out.println(login.getUid());
    }
}
