package daos;

import bean.Worker;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.List;


public interface WorkerDao {

    @Select("SELECT * FROM worker WHERE worker_id=#{id} AND password=#{password}")
    @Results({
            @Result(column = "worker_id",property = "workerId",jdbcType = JdbcType.CHAR),
            @Result(column = "worker_name",property = "workerName",jdbcType = JdbcType.CHAR)
    })
    Worker select(@Param("id") String id, @Param("password") String password);

    @Select("SELECT * FROM worker")
    @Results({
            @Result(column = "worker_id",property = "workerId",jdbcType = JdbcType.CHAR),
            @Result(column = "worker_name",property = "workerName",jdbcType = JdbcType.CHAR)
    })
    List<Worker> selectAll();


    @Update("UPDATE worker SET worker_name=#{name} WHERE worker_id=#{id}")
    void updateName(@Param("id") String id,@Param("name") String name );


    @Update("UPDATE worker SET password=#{password} WHERE worker_id=#{id}")
    void updatePassword(@Param("id") String id,@Param("password") String password);

}
