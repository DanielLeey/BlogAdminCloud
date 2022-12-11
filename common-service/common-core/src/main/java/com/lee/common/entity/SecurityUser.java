package com.lee.common.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

/**
 * @author Lee
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SecurityUser implements Serializable {

    private static final long serialVersionUID = -6762199222888946110L;

    private User user;

    private List<Resource> resources;
}
