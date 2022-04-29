package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.DentistDao;
import com.mycompany.webapp.dao.mybatis.MyDentistDao;
import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.MyDentist;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MyDentistService {
	
	@Resource
	private MyDentistDao mydentistDao;
	
	@Resource
	private DentistDao dentistDao;
	
	//내 모든 치과 목록을 가져오는 메소드(서브쿼리 사용해서 dentists 테이블이랑 mydentist 테이블 조인)
	public List<Dentist> getMyDentist(String userid) {
		return dentistDao.selectByuserid(userid);
	}
	
	//내 치과 목록 중에 특정 치과가 이미 등록되어 있는지 점검.
	public int getMyDentistByDenno(String userid, int denno) {
		return mydentistDao.countByuseridNDenno(userid, denno);
	}
	
	//내 치과 등록하기
	public void registerMyDentist(String userid, int denno) {
		log.info("실행");
		mydentistDao.insert(userid, denno);
	}
	
	//내 치과 삭제하기
	public void removeMyDentist(String userid, int denno) {
		mydentistDao.delete(userid, denno);
		log.info("실행");
	}
}
