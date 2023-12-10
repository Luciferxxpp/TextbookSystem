package daos;

import bean.In_storage;
import org.apache.ibatis.annotations.Insert;

public interface In_storageDao {
    @Insert("INSERT INTO in_storage (book_id, book_name, price,number,id) VALUES (#{book_id},#{book_name},#{price},#{number},#{id})")
    void add(In_storage book);
}
