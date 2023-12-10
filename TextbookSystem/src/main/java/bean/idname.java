package bean;

import nouse.PageUtil;

public class idname {
    private int book_id;
    private int number;
    public  idname(){}
    public  idname(int book_id,int number){
        this.book_id=book_id;
        this.number=number;
    }


    public int getBook_id() {
        return book_id;
    }
    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

}
