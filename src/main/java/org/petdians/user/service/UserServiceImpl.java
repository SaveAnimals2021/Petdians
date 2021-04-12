package org.petdians.user.service;

import lombok.extern.log4j.Log4j;
import org.petdians.common.dto.PageDTO;
import org.petdians.user.dto.UserDTO;
import org.petdians.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Log4j
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper mapper;

    @Override
    public void register(UserDTO dto) {
        mapper.register(toDomain(dto));
    }

    @Override
    public List<UserDTO> getPagedList(PageDTO dto) {
        return toDTOList(mapper.getPagedList(dto.getSkip(), dto.getPerSheet()));
    }

    @Override
    public void modify(UserDTO dto) {
        mapper.modify(toDomain(dto));
    }

    @Override
    public void delete(String userId) {
        mapper.delete(userId);
    }

    @Override
    public Integer getTotalCount() {
        return mapper.getTotalCount();
    }
}
