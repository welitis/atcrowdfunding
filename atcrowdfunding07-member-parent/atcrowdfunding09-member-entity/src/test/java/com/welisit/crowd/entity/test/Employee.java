package com.welisit.crowd.entity.test;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

	private Integer id;
	private String name;
	private Integer age;
	
	public static void main(String[] args) {
		Employee employee = new Employee(1, "aa", 23);
		System.out.println(employee);
		employee.setAge(24);
		System.out.println(employee);
		Employee employee2 = new Employee(1, "aa", 24);
		boolean equals = employee.equals(employee2);
		System.out.println(equals);
	}
}
