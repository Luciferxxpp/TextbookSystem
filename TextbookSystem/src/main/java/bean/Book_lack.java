package bean;

public class Book_lack {
    private int book_id;
    private String book_name;
    private int  price;
    private  int  number;
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
    public  void setNumber(int number){
        this.number=number;
    }
    public int getNumber(){
        return number;
    }

}
