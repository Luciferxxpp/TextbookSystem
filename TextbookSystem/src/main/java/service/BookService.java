package service;

import bean.Bill;

import java.util.*;

import daos.*;
import bean.Book_purchase;
import org.apache.ibatis.session.SqlSession;
import util.Util;

import java.io.IOException;

public class BookService {
//    public List<Book_purchase> lackBook() throws IOException {
//        SqlSession sqlSession = Util.getSqlSession();
//        Book_lackDao book_lack=sqlSession.getMapper(Book_lackDao.class);
//        return book_lack.selectAll();
//    }
    public void insert(Book_purchase purchase) throws IOException{
        SqlSession sqlSession = Util.getSqlSession();
        Book_purchaseDao book_purchase=sqlSession.getMapper(Book_purchaseDao.class);
        book_purchase.add(purchase);
        sqlSession.commit();
        sqlSession.close();

    }
    public void update(Book_purchase purchase) throws IOException{
        SqlSession sqlSession = Util.getSqlSession();
        Book_purchaseDao book_purchase=sqlSession.getMapper(Book_purchaseDao.class);
        book_purchase.update(purchase);
        sqlSession.commit();
        sqlSession.close();

    }
    public List<Book_purchase> returnPendingAll() throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        pending_purchaseDao book_purchase=sqlSession.getMapper(pending_purchaseDao.class);
        return book_purchase.selectAll();
    }
    public void insertPendingAll(Book_purchase  book) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        pending_purchaseDao book_purchase=sqlSession.getMapper(pending_purchaseDao.class);
        book_purchase.add(book);
        sqlSession.commit();
        sqlSession.close();
    }
    public void insertBill(Bill bill) throws IOException{
        SqlSession sqlSession = Util.getSqlSession();
        BillDao Bill=sqlSession.getMapper(BillDao.class);
        Bill.add(bill);
        sqlSession.commit();
        sqlSession.close();
    }
    public List<Book_purchase> bookPurchases() throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        Book_purchaseDao book_lack=sqlSession.getMapper(Book_purchaseDao.class);
        return book_lack.selectAll();

    }

    public List<Book_purchase> selectPendName(int departmentName)throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        pending_purchaseDao Bill=sqlSession.getMapper(pending_purchaseDao.class);
        return Bill.select(departmentName);
    }
    public int selectBook(int departmentName)throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookDao Bill=sqlSession.getMapper(BookDao.class);
        return Bill.selectNum(departmentName);
    }
    public void updateBook(int departmentName,int id)throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookDao Bill=sqlSession.getMapper(BookDao.class);
         Bill.update(departmentName,id);
        sqlSession.commit();
        sqlSession.close();
    }
    public  void deleteall1() throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookDao Bill=sqlSession.getMapper(BookDao.class);
        Bill.delectall1();
        sqlSession.commit();
        sqlSession.close();
    }
    public  void deleteall2() throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        pending_purchaseDao Bill=sqlSession.getMapper(pending_purchaseDao.class);
        Bill.delectall();
        sqlSession.commit();
        sqlSession.close();
    }




//    public Boolean getbill(Bill bill)throws IOException{
//        SqlSession sqlSession = Util.getSqlSession();
//        BillDao Bill=sqlSession.getMapper(BillDao.class);
//        Boolean flat=true;
//       List<Bill> bill1=Bill.selectAll();
//        String id1=bill.getId();
//        for(int i=0;i<bill1.size();i=+3)
//
//
//       if(bill1.get(i)==id1)
//            flat=false;
//
//
//        return flat;
//    }


}
