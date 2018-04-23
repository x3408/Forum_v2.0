package Dao;

import Bean.User;
import Bean.sign;

import java.util.List;

public interface SignDao {
    void save(sign sign);

    List<sign> getList(String uid);
}
