package com.lee.domain;

import com.lee.common.entity.Resource;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 用户DTO
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserDTO {

    private Long id;

    private String username;

    private String password;

    private String status;

    private List<Resource> resources;
}
