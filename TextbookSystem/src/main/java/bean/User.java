package bean;

import java.util.Objects;

public class User {
    String userId;
    String username;
    String password;
    String gender;
    String profession;

    public User() {
    }

    public User(String userId, String username, String password, String gender, String profession) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.profession = profession;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(userId, user.userId) && Objects.equals(username, user.username) && Objects.equals(password, user.password) && Objects.equals(gender, user.gender) && Objects.equals(profession, user.profession);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, username, password, gender, profession);
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", profession='" + profession + '\'' +
                '}';
    }
}
