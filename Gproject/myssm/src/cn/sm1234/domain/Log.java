package cn.sm1234.domain;

public class Log {
    private Integer id;
    private String date;
    private String username;
    private String record;

    public Log(String date, String username, String record) {
        this.date = date;
        this.username = username;
        this.record = record;
    }
    public Log(Integer id,String date, String username, String record){
        this.id = id;
        this.date = date;
        this.username = username;
        this.record = record;
    }
    public Log(){

    }

    public Log(String username, String record) {
        this.username = username;
        this.record = record;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }
}
