package cn.sm1234.impl;

import cn.sm1234.dao.LogMapper;
import cn.sm1234.domain.Log;
import cn.sm1234.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;
//    @Override
//    public void insert(Log log) {
//        logMapper.insert(log);
//    }

    @Override
    public void insert(String username, String record) {
        Log log = new Log();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date createDate = new Date();
        String createTime = simpleDateFormat.format(createDate);
        log.setDate(createTime);
        log.setRecord(record);
        log.setUsername(username);
        logMapper.insert(log);
    }

    @Override
    public List<Log> queryAll() {
        return logMapper.selectAll();
    }
}
