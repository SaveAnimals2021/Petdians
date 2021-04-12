package org.petdians.admin.service;

import lombok.Builder;
import org.mybatis.spring.annotation.MapperScan;
import org.petdians.admin.domain.Admin;
import org.petdians.admin.dto.AdminDTO;
import org.petdians.common.dto.PageDTO;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AdminService {

    void register(AdminDTO adminDTO);

    List<AdminDTO> listAll(PageDTO pageDTO);

    AdminDTO readOne(String adminID);

    void modify(AdminDTO adminDTO);

    void remove(String adminID);

    Integer getTotalCount();

    default AdminDTO toDTO (Admin admin) {

        return AdminDTO.builder().
                adminID(admin.getAdminID())
                .adminPW(admin.getAdminPW())
                .adminName(admin.getAdminName())
                .regdate(admin.getRegdate())
                .updateDate(admin.getUpdateDate())
                .build();

    }

    default Admin toDomain(AdminDTO adminDTO) {

        return Admin.builder().
                adminID(adminDTO.getAdminID())
                .adminPW(adminDTO.getAdminPW())
                .adminName(adminDTO.getAdminName())
                .regdate(adminDTO.getRegdate())
                .updateDate(adminDTO.getUpdateDate())
                .build();

    }

}
