package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Point;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.DentistService;
import com.mycompany.webapp.service.MyDentistService;
import com.mycompany.webapp.service.PointService;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.UserService.LoginResult;

import lombok.extern.log4j.Log4j2;
@CrossOrigin(origins="*", allowedHeaders = "*")
@Controller
@RequestMapping("/myPage")
@Log4j2
public class MyPageController {
	@Resource
	private PointService pointService;
	@Resource
	private UserService userService;
	@Resource
	private MyDentistService myDentistService;
	@Resource
	private DentistService dentistService;

	//마이페이지 메인화면.
	@RequestMapping("/main")
	public String myPageMenu(HttpSession session, Model model) {
		return "myPage/main";
	}

	
	//이스터에그 화면
	@CrossOrigin(origins="*", allowedHeaders = "*")
	@RequestMapping("/easteregg")
	public String eastegg(HttpSession session, Model model) {
		//Header에 이름, 포인트 값 넘기는 코드
		String userid = (String) session.getAttribute("sessionUserid");
		
		if(session.getAttribute("sessionUserid") == null) {
			String formError = "숨겨진 달걀을 확인하려면 로그인을 해주세요!";
			session.setAttribute("formError", formError);
			return "redirect:/login";
		}
		
		if(userid != null) {
			User user = userService.getUser(userid);
			String name = user.getUsername();
			model.addAttribute("name", name);
			//로그인한 사용자의 '내 치과'에 등록된 치과 객체 목록.
			List<Dentist> myDentistList = myDentistService.getMyDentist(userid);
			String patientssn = userService.getUser(userid).getUserssn();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("myDentistList", myDentistList);
			String json = jsonObject.toString();
			model.addAttribute("myDentistList", json);
			model.addAttribute("patientssn", patientssn);
			log.info("실행");
		}

		return "myPage/easteregg";
	}
	
	//마이페이지 선택시에 출력. 사용자가 내 치과로 등록한 치과 목록+등록+삭제 페이지.
	@GetMapping("/myDentist")
	public String myDentist(HttpSession session
			, @RequestParam(required=false) String denname
			, @RequestParam(defaultValue="-1") String dendomain
			, String task
			, @RequestParam(defaultValue="1") int pageNo
			, Model model) {
		log.info("실행");
		String userId = (String) session.getAttribute("sessionUserid");
		//내 치과 등록하기
		//이미 등록된 치과는 추가X.(팝업까진 띄울필요X. MyDentists테이블에 PK없기 때문에 중복 행 입력 방지조치임.)
		//1. 이미 등록된 치과인지 점검.
		//1-1. 이미 등록된 치과면 아무조치X.
		//1-2. 등록 안 된 치과면 등록.
		if(!dendomain.equals("-1")) {
			if(task.equals("add")) {
				if(myDentistService.getMyDentistByDendomain(userId, dendomain) < 1) {//0인 경우에만 추가!
					myDentistService.registerMyDentist(userId, dendomain);
				}
			} else if(task.equals("delete")) {
				//내 치과 삭제하기
				myDentistService.removeMyDentist(userId, dendomain);
			}
		}
		
		//로그인한 유저의 '내 치과' 목록을 조회.
		List<Dentist> list = myDentistService.getMyDentist(userId);
		model.addAttribute("myDentists", list);
		
		//치과 검색.(이름으로 검색.)
		if(denname != null) {
			log.info("denname: " + denname);
			int totalRows = dentistService.getDentistNumByDenname(denname);
			Pager pager = new Pager(5, 5, totalRows, pageNo);
			model.addAttribute("pager", pager);
			List<Dentist> searchedDentistList = dentistService.getDentistByDenname(denname, pager);
			model.addAttribute("searchedDentistList", searchedDentistList);
		}
		model.addAttribute("denname", denname);
		
		return "myPage/myDentist";
	}

	//마이페이지 - 내 포인트
	@GetMapping("/myPointList")
	public String myPointList(HttpSession session
			, @RequestParam(defaultValue="1") int pageNo
			, @RequestParam(defaultValue="TOTAL") String specification
			, Model model) {
		
		//로그인한 사용자의 포인트 잔액 전송.
		String userId = (String) session.getAttribute("sessionUserid");
		int pointBalance = userService.getPointBalance(userId);
		int usedPoint = userService.getusedPointBalance(userId);
		log.info("usedPoint : " + usedPoint);
		model.addAttribute("pointBalance", pointBalance);
		model.addAttribute("usedPoint", usedPoint);
		
		Pager pager = new Pager();
		List<Point> list = new ArrayList<>();
		//출력하려는 목록이 '전체/획득/사용' 중 어느 범주인지 확인하고 service의 각기 다른 메소드를 호출.
		if(specification.equals("TOTAL")) {
			//Pager객체를 생성할 수 있도록, 로그인한 유저의 포인트 내역의 총 행 수를 얻어옴.
			int totalRows = pointService.getTotalPointCount(userId);
			log.info(totalRows);
			pager = new Pager(10, 5, totalRows, pageNo);
			list = pointService.getAllPointsByUserid(userId, pager);
		} else if(specification.equals("GOT")) {
			int totalRows = pointService.getSpecificPointCount(userId, true);
			log.info(totalRows);
			pager = new Pager(10, 5, totalRows, pageNo);
			list = pointService.getEarnedPointsByUserid(userId, true, pager);
		} else {
			int totalRows = pointService.getSpecificPointCount(userId, false);
			log.info(totalRows);
			pager = new Pager(10, 5, totalRows, pageNo);
			list = pointService.getUsedPointsByUserid(userId, false, pager);
		}
		
		model.addAttribute("pager", pager);
		model.addAttribute("points", list);		
		return "myPage/myPointList";
	}

	@CrossOrigin(origins="*", allowedHeaders = "*")
	@GetMapping("/myReservationList")
	public String myReservationList() {
		log.info("실행");
		return "myPage/myReservationList";
	}

	@CrossOrigin(origins="*", allowedHeaders = "*")
	@PostMapping(value="/myReservationList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String myReservationList(HttpSession session) {
		String userId = (String) session.getAttribute("sessionUserid");
		//로그인한 사용자의 '내 치과'에 등록된 치과 객체 목록.
		List<Dentist> myDentistList = myDentistService.getMyDentist(userId);
		log.info(myDentistList);
		JSONObject jsonObject = new JSONObject();
		//주민번호
		jsonObject.put("patientssn", userService.getUser(userId).getUserssn());
		//jsp에서 for문을 이용해서 dendomain만 추출해서 ajax통신해야함.
		jsonObject.put("myDentistList", myDentistList);
		log.info(jsonObject);
		
		return jsonObject.toString();
	}
	
	//마이페이지 - 캘린더.
	@RequestMapping("/reservationHistoryWithCalendar")
	public String reservationHistoryWithCalendar(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionUserid");
		//로그인한 사용자의 '내 치과'에 등록된 치과 객체 목록.
		List<Dentist> myDentistList = myDentistService.getMyDentist(userId);
		String patientssn = userService.getUser(userId).getUserssn();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("myDentistList", myDentistList);
		String json = jsonObject.toString();
		model.addAttribute("myDentistList", json);
		model.addAttribute("patientssn", patientssn);
		log.info("실행");
		return "myPage/reservationHistoryWithCalendar";
	}	
	
	//마이페이지에서 햄버거 메뉴 중 '설정' 클릭시에 사용자의 계정정보 페이지 출력.
	@RequestMapping("/myInformation")
	public String myInformation(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("sessionUserid");
		User user = userService.getUser(userid);
		model.addAttribute("user", user);
		return "myPage/myInformation";
	}

	//마이페이지 - 설정 - 회원정보 '수정하기' 클릭시에 출력. 
	@RequestMapping("/myInformationEditor")
	public String myInformationEditor() {
		log.info("실행");
		return "myPage/myInformationEditor";
	}
	
	//마이페이지 - 설정 - '탈퇴하기' 클릭시에 출력
	@GetMapping("/deleteAccount")
	public String signOutForm() {
		log.info("실행");
		return "myPage/deleteAccount";
	}
	
	@PostMapping("/deleteAccount")
	public String signOut(User user, Model model, HttpSession session) {
		LoginResult result = userService.login(user);
		if (result == LoginResult.FAILED) {
			model.addAttribute("error", "아이디나 비밀번호가 일치하지 않습니다.");
			return "myPage/deleteAccount";
		}
		userService.deleteUser(user.getUserid());
		session.removeAttribute("sessionUserid");
		session.removeAttribute("headerInfo");
		return "redirect:/";
	} 
	
	@PostMapping(value="/minusPoint", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String minusPoint(HttpSession session) {
		String userid = (String) session.getAttribute("sessionUserid");
		User user = userService.getUser(userid);
		int userPoint = user.getUserpoint() - 10000;
		user.setUserpoint(userPoint);
		log.info("user.getUserpoint() : " + user.getUserpoint());
		user.setUserusedpoint(user.getUserusedpoint() + 10000);
		log.info("user.getUserusedpoint() : " + user.getUserusedpoint());
		log.info("user.getUserid() : " + user.getUserid());
		int result = userService.updateUser(user);
		log.info("result : " + result);
		// points테이블에 스케일링 할인으로 포인트 사용한 내역 추가.
		Point point = new Point();
		point.setUserid(userid);
		point.setPointisplus(false);
		point.setPointamount(10000);
		point.setPointdesc("스케일링 할인");
		point.setPointdate(new Date());
		pointService.addPoint(point);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		return obj.toString();
	} 

}
