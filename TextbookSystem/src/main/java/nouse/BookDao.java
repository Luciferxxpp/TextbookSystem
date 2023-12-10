package nouse;
import bean.Book;
import org.apache.ibatis.annotations.Insert;

public interface BookDao {

    @Insert("INSERT INTO book (book_id, book_name, press, author, price,publication_date) VALUES (#{book_id},#{book_name},#{press},#{author},#{price},#{publication_date})")
    void add(Book book);
}
