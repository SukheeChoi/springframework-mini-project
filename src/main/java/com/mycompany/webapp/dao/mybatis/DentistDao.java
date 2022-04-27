package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Dentist;

@Mapper
public interface DentistDao {
	public Dentist selectByDenno(int denno);
	public List<Dentist> selectByDenname(String denname);
	public List<Dentist> selectByDenaddress(String denaddress);
}
