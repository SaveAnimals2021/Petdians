package org.petdians.member.service;

import org.petdians.member.domain.MemberVO;
import org.petdians.member.dto.MemberDTO;
import org.petdians.common.dto.PageDTO;

import java.util.List;

public interface MemberService {

    void register(MemberDTO memberDTO);

    List<MemberDTO> listAll(PageDTO pageDTO);

    MemberDTO readOne(String adminID);

    void modify(MemberDTO memberDTO);

    void remove(String adminID);

    Integer getTotalCount();

    default MemberDTO toDTO (MemberVO memberVO) {

        return MemberDTO.builder().
                memberID(memberVO.getMemberID())
                .memberPW(memberVO.getMemberPW())
                .memberName(memberVO.getMemberName())
                .regdate(memberVO.getRegdate())
                .updateDate(memberVO.getUpdateDate())
                .build();

    }

    default MemberVO toDomain(MemberDTO memberDTO) {

        return MemberVO.builder().
                memberID(memberDTO.getMemberID())
                .memberPW(memberDTO.getMemberPW())
                .memberName(memberDTO.getMemberName())
                .regdate(memberDTO.getRegdate())
                .updateDate(memberDTO.getUpdateDate())
                .build();

    }

}
