package Service.ServiceImpl;

import Bean.comment;
import Dao.CommentDao;
import Service.CommentService;

import java.util.List;

public class CommentServiceImpl implements CommentService{
    private CommentDao cd;

    public void setCd(CommentDao cd) {
        this.cd = cd;
    }

    public void save(comment comment) {
        //直接向DAO层调用方法
        cd.save(comment);
    }

    @Override
    public List<comment> getList() {
        //向DAO层要list
        List<comment> list= cd.getList();
        return list;
    }
}
