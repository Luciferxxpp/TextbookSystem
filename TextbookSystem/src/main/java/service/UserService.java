package service;

import bean.User;
import daos.UserDao;
import org.apache.ibatis.session.SqlSession;
import util.Util;

import java.io.IOException;
import java.util.List;

public class UserService {

    public UserService() {
    }

    /*
     * 注册，返回true注册成功，false注册失败
     * */
    public boolean register(User user) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);

        User user1 = userDao.selectById(user.getUserId());//先在数据库中查找是否有当前user的id

        if(user1!=null){//若查询到的结果不为null，说明数据库中已经存在当前id，即当前id已被注册，返回false
            sqlSession.close();
            return false;
        }

        //当前id未被注册，将注册信息存入数据库
        userDao.add(user);

        sqlSession.commit();

        sqlSession.close();
        return true;
    }


    /*
     * 登录，返回当前登录的用户，若返回为空，代表登录失败
     * */
    public User login(String id,String password)throws IOException{
        SqlSession sqlSession=Util.getSqlSession();
        UserDao userDao=sqlSession.getMapper(UserDao.class);
        User user=userDao.select(id,password);
        sqlSession.close();
        return user;
    }

    /*
     * 修改用户名
     * */
    public void changeName(String id,String name) throws IOException {
        SqlSession sqlSession=Util.getSqlSession();
        UserDao userDao=sqlSession.getMapper(UserDao.class);
        userDao.updateName(id,name);
        sqlSession.commit();
        sqlSession.close();
    }


    /*
     * 修改密码
     * */
    public void changePassword(String id,String password)throws IOException{
        SqlSession sqlSession=  Util.getSqlSession();
        UserDao userDao=sqlSession.getMapper(UserDao.class);
        userDao.updatePassword(id,password);
        sqlSession.commit();
        sqlSession.close();
    }


    /*
     * 修改专业
     * */
    public void changeProfession(String id, String password)throws IOException{
        SqlSession sqlSession=Util.getSqlSession();

        UserDao userDao=sqlSession.getMapper(UserDao.class);

        userDao.updateProfession(id,password);
        sqlSession.commit();
        sqlSession.close();

    }



}
