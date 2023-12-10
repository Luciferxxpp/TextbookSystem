package bean;

public class In_storage {
    private String id;
    private int book_id;
    private String book_name;
    private int  price;
    private  int  number;

    public In_storage(  int book_id, String book_name, int price, int number) {

        this.book_id = book_id;
        this.book_name = book_name;
        this.price = price;
        this.number = number;
    }

    public In_storage() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
