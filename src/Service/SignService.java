package Service;

import Bean.User;
import Bean.sign;

import java.util.List;

public interface SignService {
    void save(sign sign);

    List<sign> getList(String uid);
}
