package cn.sm1234.util;

import cn.sm1234.domain.UserSelect;

import java.util.List;

public class AjaxResult {
    private boolean success;

    private String message;

    private UserSelect userSelect;
    private List userList;
    private List hourList;
    private List onlineList;
    private String[] check_val;
    private Page page;
    private Object data;

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public UserSelect getUserSelect() {
        return userSelect;
    }

    public void setUserSelect(UserSelect userSelect) {
        this.userSelect = userSelect;
    }

    public List getUserList() {
        return userList;
    }

    public void setUserList(List userList) {
        this.userList = userList;
    }

    public String[] getCheck_val() {
        return check_val;
    }

    public void setCheck_val(String[] check_val) {
        this.check_val = check_val;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public List getHourList() {
        return hourList;
    }

    public void setHourList(List hourList) {
        this.hourList = hourList;
    }

    public List getOnlineList() {
        return onlineList;
    }

    public void setOnlineList(List onlineList) {
        this.onlineList = onlineList;
    }
}
