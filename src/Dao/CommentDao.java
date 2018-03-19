package Dao;

import Bean.comment;

import java.util.List;

public interface CommentDao {
    void save(comment comment);

    List<comment> getList(Integer tid);
}
