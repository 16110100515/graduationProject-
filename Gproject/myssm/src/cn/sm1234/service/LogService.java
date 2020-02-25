package cn.sm1234.service;

import cn.sm1234.domain.Log;

import java.util.List;

public interface LogService {
//    void insert(Log log);
    void insert(String username,String record);
    List<Log> queryAll();
}
