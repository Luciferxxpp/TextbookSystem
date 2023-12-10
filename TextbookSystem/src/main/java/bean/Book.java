package bean;

public class Book {
    private int book_id;
    private String book_name;
    private String press;
    private String author;
    private long  price;
    //private  String publication_data;
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
    public String getPress() {
        return press;
    }
    public void setPress(String press) {
        this.press = press;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public long getPrice() {
        return price;
    }
    public void setPrice(long price) {
        this.price = price;
    }
  /*  public String getPublication_data() {
        return publication_data;
    }
    public void setPublication_data(String publication_data) {
        this.publication_data = publication_data;
    }*/
    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", press='" + press + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                '}';
    }

    public Book(int book_id, String book_name, String press, String author, long price) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.press = press;
        this.author = author;
        this.price = price;
    }

    public Book(int book_id) {
        this.book_id = book_id;
    }

    public Book(String book_name, String author, String press, int price) {
        this.book_name = book_name;
        this.press = press;
        this.author = author;
        this.price = price;
    }

    public Book() {

    }
}
