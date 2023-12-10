package service;

import bean.Book;
import daos.BookStackDao;
import org.apache.ibatis.session.SqlSession;
import util.Util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BookService2 {


    public void addBook(Book book) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookStackDao dao = sqlSession.getMapper(BookStackDao.class);
        dao.add(book);
        sqlSession.commit();
        sqlSession.close();

    }

    public List<Book> selectAll() throws IOException {
        SqlSession sqlSession=Util.getSqlSession();
        BookStackDao dao =sqlSession.getMapper(BookStackDao.class);
        List<Book> books = dao.selectAll();
        sqlSession.close();
        return books;
    }

    public void updateBook(Book book) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookStackDao dao = sqlSession.getMapper(BookStackDao.class);
        dao.updateBook(book);
        sqlSession.commit();
        sqlSession.close();
    }
    public Book selectById(int bookId) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookStackDao dao = sqlSession.getMapper(BookStackDao.class);
        Book book = dao.selectById(bookId);
        sqlSession.commit();
        sqlSession.close();
        return book;
    }

    public void deleteBookById(int bookId) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookStackDao dao = sqlSession.getMapper(BookStackDao.class);
        dao.deleteBook(bookId);
        sqlSession.commit();
        sqlSession.close();
    }

    public List<Book> searchBook(String key) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookStackDao dao = sqlSession.getMapper(BookStackDao.class);
        List<Book> books = dao.searchBook(key);
        sqlSession.close();
        return books;
    }

    public List<Integer> selectNumber(List<Book> books) throws IOException {
        SqlSession sqlSession = Util.getSqlSession();
        BookStackDao dao = sqlSession.getMapper(BookStackDao.class);

        List<Integer> list=new ArrayList<>();
        for (Book book : books) {
            System.out.println(book);
            Integer i = dao.selectNumber(book.getBook_id());
            list.add(i);
        }
        sqlSession.close();
        return list;
    }

}
