package bean;

public class Bill {
    private String id;
    private String cpyName;

    public void setId(String id) {
        this.id = id;
    }

    private int money;

    public String getId() {
        return id;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getCpy_name() {
        return cpyName;
    }

    public void setCpy_name(String cpyName) {
        this.cpyName = cpyName;
    }


}
