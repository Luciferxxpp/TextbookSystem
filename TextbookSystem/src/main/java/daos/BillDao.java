package daos;

import bean.Bill;

import bean.Book_purchase;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BillDao {
    @Insert("INSERT INTO bill (id, cpy_name, money) VALUES (#{id},#{cpyName},#{money})")
    void add(Bill book);
    @Select("SELECT * FROM bill")
    List<Bill> selectAll();
    @Select("SELECT * FROM bill WHERE id =#{id}  ")
    List<Bill> select(int id);
}
