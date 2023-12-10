package service;

import bean.Book_lack;
import bean.In_storage;
import daos.Book_lackDao;
import daos.BookDao;
import daos.In_storageDao;
import org.apache.ibatis.session.SqlSession;
import util.Util;

import java.io.IOException;
import java.util.List;

public class Book_lackService {

    public Book_lackService() {
    }
    public static void insert(Book_lack book_lack) throws IOException{
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao Book_lack=sqlSession.getMapper(Book_lackDao.class);
        Book_lack.add(book_lack);
        sqlSession.commit();
        sqlSession.close();
    }
    public Book_lack select(int id) throws IOException {
        SqlSession sqlSession= Util.getSqlSession();
        Book_lackDao book_lackDao=sqlSession.getMapper(Book_lackDao.class);
        Book_lack book_lack=book_lackDao.select(id);

        return book_lack;
    }
    public void update(int book_id,String book_name,int price,int number) throws IOException {
        SqlSession sqlSession= Util.getSqlSession();
        Book_lackDao book_lackDao=sqlSession.getMapper(Book_lackDao.class);
        book_lackDao.update(book_id,book_name,price,number);
        sqlSession.commit();
        sqlSession.close();
    }


    public void insert2(In_storage in_storage) throws IOException{
        SqlSession sqlSession = Util.getSqlSession();
        In_storageDao inStorageDao=sqlSession.getMapper(In_storageDao.class);
        inStorageDao.add(in_storage);
        sqlSession.commit();
        sqlSession.close();
    }
    public void delete(int book_id)throws IOException{
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao book_purchase=sqlSession.getMapper(Book_lackDao.class);
        book_purchase.delete(book_id);
        sqlSession.commit();
        sqlSession.close();
    }
    public List<Book_lack> lackbook() throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao book_lack=sqlSession.getMapper(Book_lackDao.class);
        List<Book_lack> list=book_lack.selectAll();


        return list;
    }
    public List<In_storage> inStoragesbook() throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao book_lack=sqlSession.getMapper(Book_lackDao.class);
        List<In_storage> list=book_lack.selectAll2();
        return list;
    }
    public  int selectnum(int id) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao book_lack=sqlSession.getMapper(Book_lackDao.class);
        int num=book_lack.selectnum(id);
        return num;
    }
    public int selectnum2(int id) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao book_lack=sqlSession.getMapper(Book_lackDao.class);
        int num2=book_lack.selectnum2(id);
        return num2;
    }
    public void updatenum(int num,int id) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao book_lack=sqlSession.getMapper(Book_lackDao.class);
        book_lack.updatenum(num,id);
        sqlSession.commit();
        sqlSession.close();
    }
    public void delectall() throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        Book_lackDao book_lack=sqlSession.getMapper(Book_lackDao.class);
        book_lack.delectall();
        sqlSession.commit();
        sqlSession.close();
    }
    public String select2(int id) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookDao book=sqlSession.getMapper(BookDao.class);
        String name=book.select2(id);
        return name;
    }
    public int select3(int id) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookDao book=sqlSession.getMapper(BookDao.class);
        int price=book.select3(id);
        return price;
    }
}