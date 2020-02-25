package cn.sm1234.dao;

import cn.sm1234.domain.Log;

import java.util.List;

public interface LogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Log record);

    Log selectByPrimaryKey(Integer id);

    List<Log> selectAll();

    int updateByPrimaryKey(Log record);
}
