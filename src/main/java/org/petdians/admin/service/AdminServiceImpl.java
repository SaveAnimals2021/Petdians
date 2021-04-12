package org.petdians.admin.service;

import org.petdians.admin.domain.Admin;
import org.petdians.admin.dto.AdminDTO;
import org.petdians.admin.mapper.AdminMapper;
import org.petdians.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    AdminMapper mapper;

    @Override
    public void register(AdminDTO adminDTO) {

        mapper.insert(toDomain(adminDTO));

    }

    @Override
    public List<AdminDTO> listAll(PageDTO pageDTO) {

        return mapper.selectAll(pageDTO.getSkip(), pageDTO.getPerSheet())
                .stream()
                .map(admin -> toDTO(admin))
                .collect(Collectors.toList());
    }

    @Override
    public AdminDTO readOne(String adminID) {
        return toDTO(mapper.selectOne(adminID));
    }

    @Override
    public void modify(AdminDTO adminDTO) {
        mapper.update(toDomain(adminDTO));
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
