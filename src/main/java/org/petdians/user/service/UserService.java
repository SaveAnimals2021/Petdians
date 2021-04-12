package org.petdians.user.service;

import org.petdians.common.dto.PageDTO;
import org.petdians.user.domain.UserVO;
import org.petdians.user.dto.UserDTO;

import java.util.List;
import java.util.stream.Collectors;

public interface UserService {

    void register(UserDTO dto);

    List<UserDTO> getPagedList(PageDTO dto);

    void modify(UserDTO dto);

    void delete(String userId);
    Integer getTotalCount();
    default UserVO toDomain(UserDTO dto) {
        UserVO vo = new UserVO();

        vo.setUsername(dto.getUsername());
        vo.setUserid(dto.getUserid());
        vo.setUserpw(dto.getUserpw());
        vo.setUseremail(dto.getUseremail());
        vo.setUserphone(dto.getUserphone());
        vo.setRegdate(dto.getRegdate());
        vo.setUpdatedate(dto.getUpdatedate());

        return vo;
    }

    default UserDTO toDTO(UserVO vo) {

        UserDTO dto = new UserDTO();

        dto.setUsername(vo.getUsername());
        dto.setUserid(vo.getUserid());
        dto.setUserpw(vo.getUserpw());
        dto.setUseremail(vo.getUseremail());
        dto.setUserphone(vo.getUserphone());
        dto.setRegdate(vo.getRegdate());
        dto.setUpdatedate(vo.getUpdatedate());

        return dto;
    }

    default List<UserDTO> toDTOList(List<UserVO> list) {
        return list.stream().map(a -> {
            return toDTO(a);
        }).collect(Collectors.toList());
    }
}
