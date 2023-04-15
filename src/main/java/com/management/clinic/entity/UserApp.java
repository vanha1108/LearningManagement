package com.management.clinic.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserApp implements Serializable {

    private Long id;
    private String fullName;
    private String email;
    private String mobile;
    private String username;
    private String password;
}
