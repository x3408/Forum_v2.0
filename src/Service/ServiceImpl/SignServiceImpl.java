package Service.ServiceImpl;

import Bean.User;
import Bean.sign;
import Dao.SignDao;
import Service.SignService;

import java.util.List;

public class SignServiceImpl implements SignService{
    private SignDao sd;

    public void setSd(SignDao sd) {
        this.sd = sd;
    }

    @Override
    public void save(sign sign) {
        sd.save(sign);
    }

    @Override
    public List<sign> getList(String uid) {
        List<sign> list=sd.getList(uid);
        return list;
    }
}
