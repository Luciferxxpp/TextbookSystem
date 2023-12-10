package service;

import bean.Worker;
import daos.WorkerDao;
import org.apache.ibatis.session.SqlSession;
import util.Util;

import java.io.IOException;

public class WorkerService {

    public Worker login(String id, String password) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();

        WorkerDao workerDao = sqlSession.getMapper(WorkerDao.class);

        Worker worker = workerDao.select(id, password);
        sqlSession.close();
        return worker;
    }

    public void changeName(String id,String name) throws IOException {
        SqlSession sqlSession=Util.getSqlSession();

        WorkerDao workerDao = sqlSession.getMapper(WorkerDao.class);

        workerDao.updateName(id,name);
        sqlSession.commit();
        sqlSession.close();
    }

    public void changePassword(String id,String password) throws IOException {
        SqlSession sqlSession=Util.getSqlSession();

        WorkerDao workerDao = sqlSession.getMapper(WorkerDao.class);

        workerDao.updatePassword(id,password);
        sqlSession.commit();
        sqlSession.close();
    }


}
