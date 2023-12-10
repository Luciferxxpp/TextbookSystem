package daos;

import bean.Book;
import org.apache.ibatis.annotations.*;

import java.util.List;
public interface BookStackDao {


    // 添加书籍
    @Insert("INSERT INTO book (book_id,book_name,press,author,price) VALUES (#{book_id},#{book_name},#{press},#{author},#{price})")
    void add(Book book);

    // 删除书籍
    @Delete("DELETE FROM book WHERE book_id=#{BookId}")
    void deleteBook(@Param("BookId") int BookId);

    // 根据关键字查询书籍
    @Select("SELECT * FROM book WHERE press=#{key} or book_name=#{key} or author=#{key}" )
    List<Book> searchBook(String key);

    //修改书籍信息
    @Update("UPDATE book SET book_name=#{book.book_name}, author=#{book.author}, press=#{book.press}, price=#{book.price} WHERE book_id=#{book.book_id}")
    void updateBook(@Param("book") Book book);

    @Select("SELECT * FROM book WHERE book_id=#{BookId}")
    Book selectById(int bookId);



    @Results({
            @Result(property = "book_id", column = "book_id"),
            @Result(property = "book_name", column = "book_name"),
            @Result(property = "press", column = "press"),
            @Result(property = "author", column = "author"),
            @Result(property = "price", column = "price")
    })
    @Select("SELECT * FROM book")
    List<Book> selectAll();


    @Select("SELECT number FROM inventory WHERE book_id=#{id}")
    Integer selectNumber(int id);
}
