package daos;

import bean.Book_purchase;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface Book_purchaseDao {
    @Insert("INSERT INTO book_purchase (book_id, book_name, price,number,id) " +
            "VALUES (#{book_id},#{book_name},#{price},#{number},#{id})")
    void add(Book_purchase book);
    @Update("UPDATE book_purchase set book_name=#{book_name}, price=#{price}, " +
            "number=#{number},id=#{id}  where  (book_id=#{book_id}) ")
    void update(Book_purchase book);
    @Select("SELECT * FROM book_purchase")
    List<Book_purchase> selectAll();
    @Select("SELECT * FROM book_purchase WHERE id =#{id}  ")
    List<Book_purchase> select(@Param("id") int id);


}

