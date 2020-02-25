package cn.sm1234.domain;

public class UserSelect {
    private Integer id;
    private String belongto;
    private String name;
    private String fieldname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBelongto() {
        return belongto;
    }

    public void setBelongto(String belongto) {
        this.belongto = belongto;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFieldname() {
        return fieldname;
    }

    public void setFieldname(String fieldname) {
        this.fieldname = fieldname;
    }
}
