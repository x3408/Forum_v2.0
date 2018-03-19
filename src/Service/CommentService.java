package Service;

import Bean.comment;

import java.util.List;

public interface CommentService {
    void save(comment comment);
    List<comment>  getList(Integer tid);
}
