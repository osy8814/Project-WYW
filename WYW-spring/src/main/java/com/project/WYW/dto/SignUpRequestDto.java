package com.project.WYW.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Data
@AllArgsConstructor
@EqualsAndHashCode
@NoArgsConstructor
@Builder
public class SignUpRequestDto {
	private int id;

	private String name;

	@Pattern(regexp = "[a-zA-Z0-9]{4,16}")
	private String userId;

	@Pattern(regexp = "^((?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\W]).{8,})$")
	private String password;

	@Email
	@NotEmpty
	private String email;

	private String mobile1;

	private String mobile2;

	private String mobile3;

	private String address;

	private Date createdAt;

	String getPhoneNumber() {
		return mobile1 + "-" + mobile2 + "-" + mobile3;
	}
}
