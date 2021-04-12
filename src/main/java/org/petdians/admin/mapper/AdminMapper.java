package org.petdians.admin.mapper;

import lombok.extern.log4j.Log4j;
import org.apache.ibatis.annotations.Param;
import org.petdians.admin.domain.Admin;
import org.petdians.common.dto.PageDTO;

import java.util.List;

public interface AdminMapper {

    void insert(Admin admin);

    List<Admin> selectAll(@Param("skip") Integer skip,
                          @Param("perSheet") Integer perSheet);

    Admin selectOne(String adminID);

    void update(Admin admin);

    void delete(String adminID);

    Integer getTotalCount();

}
