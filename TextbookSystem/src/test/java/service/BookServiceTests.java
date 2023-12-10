package service;

import static org.junit.Assert.*;

import bean.Book;
import org.junit.Before;
import org.junit.Test;
import java.io.IOException;
import java.util.List;

public class BookServiceTests {
    private BookService2 bookService;

    @Before
    public void setUp() {
        bookService = new BookService2();
    }

    @Test
    public void testAddBook() throws IOException {
        // 创建一个书籍对象
        Book book = new Book();
        book.setBook_id(99);
        book.setBook_name("Book 1");
        book.setPress("Press 1");
        book.setAuthor("Author 1");
        book.setPrice(20);

        // 添加书籍
        bookService.addBook(book);

        // 根据book_id查询书籍，验证是否成功添加
        Book addedBook = bookService.selectById(1);
        assertNotNull(addedBook);
    }

    @Test
    public void testSelectAll() throws IOException {
        // 获取所有书籍
        List<Book> books = bookService.selectAll();
        assertNotNull(books);
        assertTrue(books.size() > 0);
    }

    @Test
    public void testUpdateBook() throws IOException {
        // 创建一个书籍对象并添加到数据库中
        Book book = new Book();
        book.setBook_id(1);
        book.setBook_name("Book");
        book.setPress("Press");
        book.setAuthor("Au");
        book.setPrice(20);


        // 修改书籍信息
        book.setPress("Updated Press");
        bookService.updateBook(book);

        // 查询修改后的书籍信息
        Book updatedBook = bookService.selectById(1);
        assertEquals("Updated Press", updatedBook.getPress());
    }
    @Test
    public void testDeleteBookById() throws IOException {
        // 创建一个书籍对象并添加到数据库中
        Book book = new Book();
        book.setBook_id(88);
        book.setBook_name("Book 1");
        book.setPress("Press 1");
        book.setAuthor("Author 1");
        book.setPrice(20);

        bookService.addBook(book);

        // 删除书籍
        bookService.deleteBookById(88);

        // 查询是否删除成功
        Book deletedBook = bookService.selectById(88);
        assertNull(deletedBook);
    }
    // 测试 searchBook 方法
    @Test
    public void testSearchBook() throws IOException {
        // 添加一些书籍到数据库中
        Book book1 = new Book();
        book1.setBook_id(33);
        book1.setBook_name("Book 1");
        book1.setPress("Press 1");
        book1.setAuthor("Author 1");
        book1.setPrice(20);

        Book book2 = new Book();
        book2.setBook_id(44);
        book2.setBook_name("Book 2");
        book2.setPress("Press 2");
        book2.setAuthor("Author 2");
        book2.setPrice(30);

        bookService.addBook(book1);
        bookService.addBook(book2);

        // 搜索书籍
        List<Book> result = bookService.searchBook("33");


    }

    // 测试 selectNumber 方法
    @Test
    public void testSelectNumber() throws IOException {
        // 添加一些书籍到数据库中
        Book book1 = new Book();
        book1.setBook_id(55);
        book1.setBook_name("Book 1");
        book1.setPress("Press 1");
        book1.setAuthor("Author 1");
        book1.setPrice(20);

        Book book2 = new Book();
        book2.setBook_id(66);
        book2.setBook_name("Book 2");
        book2.setPress("Press 2");
        book2.setAuthor("Author 2");
        book2.setPrice(30);

        bookService.addBook(book1);
        bookService.addBook(book2);

        // 查询书籍数量
        List<Book> books = bookService.selectAll();
        List<Integer> numbers = bookService.selectNumber(books);

    }

}
