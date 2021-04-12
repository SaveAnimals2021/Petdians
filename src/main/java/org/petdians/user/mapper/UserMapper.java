package org.petdians.user.mapper;

import org.apache.ibatis.annotations.Param;
import org.petdians.user.domain.UserVO;

import java.util.List;

public interface UserMapper {

    void register(UserVO vo);

    List<UserVO> getPagedList(@Param("skip") Integer skip,
                               @Param("perSheet") Integer perSheet);

    void modify(UserVO vo);

    void delete(String userid);

    Integer getTotalCount();

}
