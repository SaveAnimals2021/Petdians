package org.petdians.member.mapper;

import org.apache.ibatis.annotations.Param;
import org.petdians.member.domain.MemberVO;

import java.util.List;

public interface MemberMapper {

    void insert(MemberVO memberVO);

    List<MemberVO> selectAll(@Param("skip") Integer skip,
                             @Param("perSheet") Integer perSheet);

    MemberVO selectOne(String adminID);

    void update(MemberVO memberVO);

    void delete(String adminID);

    Integer getTotalCount();

    MemberVO read(String memberid);

}
