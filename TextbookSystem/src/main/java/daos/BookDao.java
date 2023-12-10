package daos;

import bean.Book;
import bean.ventory;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface BookDao {
    @Insert("INSERT INTO inventory (book_id, number) VALUES (#{id},#{number})")
    void add(Book book);

    @Select("SELECT * FROM inventory")
    List<ventory> selectAll();

    @Update("update inventory set number=#{number} where book_id=#{book_id}")
    void update(@Param("number") int num, @Param("book_id") int id);

    @Select("select number from inventory where book_id=#{book_id}")
    int selectNum(int book_id);

    @Select("select book_name from book where book_id=#{book_id}")
    String select2(int id);
    @Select("select price from book where book_id=#{book_id}")
    int select3(int id);
    @Delete("Delete  from book_purchase")
    void delectall1();
}
