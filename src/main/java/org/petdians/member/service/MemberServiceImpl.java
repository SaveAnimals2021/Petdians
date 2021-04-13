package org.petdians.member.service;

import org.petdians.member.dto.MemberDTO;
import org.petdians.member.mapper.MemberMapper;
import org.petdians.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper mapper;

    @Override
    public void register(MemberDTO memberDTO) {

        mapper.insert(toDomain(memberDTO));

    }

    @Override
    public List<MemberDTO> listAll(PageDTO pageDTO) {

        return mapper.selectAll(pageDTO.getSkip(), pageDTO.getPerSheet())
                .stream()
                .map(admin -> toDTO(admin))
                .collect(Collectors.toList());
    }

    @Override
    public MemberDTO readOne(String adminID) {
        return toDTO(mapper.selectOne(adminID));
    }

    @Override
    public void modify(MemberDTO memberDTO) {
        mapper.update(toDomain(memberDTO));
    }

    @Override
    public void remove(String adminID) {
        mapper.delete(adminID);
    }

    @Override
    public Integer getTotalCount() {
        return mapper.getTotalCount();
    }
}
