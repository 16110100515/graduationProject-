package cn.sm1234.dao;

import cn.sm1234.domain.Return;

import java.util.List;

public interface ReturnMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Return record);

    Return selectByPrimaryKey(Integer id);

    List<Return> selectAll();

    int updateByPrimaryKey(Return record);
}