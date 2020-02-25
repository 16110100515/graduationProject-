package cn.sm1234.exception;

public class LoginFailException extends RuntimeException {
    public LoginFailException(String msg){
        super(msg);
    }
}
