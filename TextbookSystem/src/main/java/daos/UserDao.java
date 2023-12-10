package daos;

import bean.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.List;

public interface UserDao {

    /*
     * 添加用户
     * */
    @Insert("INSERT INTO user (user_id, username, password, gender, profession) VALUES (#{userId},#{username},#{password},#{gender},#{profession})")
    void add(User user);

    /*
     * 查询所有
     * */
    @Select("SELECT * FROM user")
    List<User> selectAll();


    /*
     * 通过学号密码查询用户（主要用于登录功能）
     * */

    @Select("SELECT * FROM user WHERE user_id =#{userId} AND password = #{password} ")
    @Result(column = "user_id",property = "userId",jdbcType = JdbcType.CHAR)
    User select(@Param("userId") String id, @Param("password") String password);

    /*
     * 通过用户名查询用户
     * */
    @Result(column = "user_id",property = "userId",jdbcType = JdbcType.CHAR)
    @Select("SELECT * FROM user WHERE username= #{name}")
    List<User> selectByName(String name);

    /*
     * 通过id查询用户
     * */
    @Result(column = "user_id",property = "userId",jdbcType = JdbcType.CHAR)
    @Select("SELECT * FROM user WHERE user_id=#{id}")
    User selectById(String id);


    /*
     * 通过id查询用户名
     * */
    @Result(column = "user_id",property = "userId",jdbcType = JdbcType.CHAR)
    @Select("SELECT username FROM user WHERE user_id=#{id}")
    String selectName(String id);


    /*
     * 修改密码
     * */
    @Update("UPDATE user SET password = #{password} WHERE user_id=#{id}")
    void updatePassword(@Param("id")String id, @Param("password") String password);


    /*
     * 修改用户名
     * */
    @Update("UPDATE user SET username=#{username} WHERE user_id=#{id}")
    void updateName(@Param("id") String id,@Param("username") String name );

    /*
     * 修改专业
     * */
    @Update("UPDATE user SET profession=#{profession} WHERE user_id=#{id}")
    void updateProfession(@Param("id") String id,@Param("profession") String profession);



    /*
     * 删除用户
     * */
    @Delete("DELETE  FROM user WHERE user_id=#{id}")
    void delete(String id);
}
