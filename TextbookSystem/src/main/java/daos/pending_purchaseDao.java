package daos;

import bean.Book_purchase;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface pending_purchaseDao {
    @Insert("INSERT INTO pending_purchase (book_id, book_name, price,number,id) VALUES (#{book_id},#{book_name},#{price},#{number},#{id})")
    void add(Book_purchase book);
    @Select("SELECT * FROM pending_purchase")
    List<Book_purchase> selectAll();
    @Select("SELECT * FROM pending_purchase WHERE id =#{id} ")
    List<Book_purchase> select(@Param("id") int id);

    @Delete("Delete  from pending_purchase")
    void delectall();


}

