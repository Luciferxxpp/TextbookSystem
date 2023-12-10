package daos;

import bean.Book_lack;
import bean.Book_purchase;
import bean.In_storage;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface Book_lackDao {
    @Insert("INSERT INTO book_lack (book_id, book_name, price,number) VALUES (#{book_id},#{book_name},#{price},#{number})")
    void add(Book_lack book);
    @Select("SELECT * FROM book_lack")
    List<Book_lack> selectAll();
    @Select("SELECT * FROM book_lack WHERE book_id =#{bool_id}  ")
    Book_lack select(int id);
    @Update("UPDATE book_lack SET book_name = #{book_name},price=#{price},number=#{number} WHERE book_id=#{book_id}")
    void update(@Param("book_id") int book_id, @Param("book_name") String book_name,@Param("price") int price,@Param("number") int number);
    @Delete("Delete FROM book_lack WHERE book_id = #{book_id}")
    void delete(@Param("book_id") int id);
    @Select("SELECT * FROM in_storage")
    List<In_storage> selectAll2();
    @Select("select number from inventory where book_id=#{book_id}")
    int selectnum(int id);
    @Select("select number from book_lack where book_id=#{book_id}")
    int selectnum2(int id);
    @Update("update inventory set number=#{number} where book_id=#{book_id}")
    void updatenum(@Param("number") int num,@Param("book_id") int id);
    @Delete("Delete  from in_storage")
    void delectall();
}

