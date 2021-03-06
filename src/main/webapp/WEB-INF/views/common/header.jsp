<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<header class="header">
	<a href="${pageContext.request.contextPath}/">
		<h1 id="header__logo" class="logo-text-black-sm">Teethtory</h1>
	</a>
	<div id="header__hamburger-btn">
		<span class="hamburger-btn__bar"></span>
		<span class="hamburger-btn__bar"></span>
		<span class="hamburger-btn__bar"></span>
	</div>
</header>
<style>
	#header-seedling {
		font-size: 3rem;
		color:  rgb(164, 211, 147);
	}
	
	#header-pagelines {
		font-size: 3rem;
		color: rgb(13, 173, 27);
	}
	
	#header-tree {
		font-size: 3rem;
		color: rgb(10, 109, 18);
	}
	
	#header-doctor {
		font-size: 3rem;
		color: #42A5F5;
	}
</style>
<aside class="sidebar-menu hidden">
	<!-- exit button -->
	<div class="sidebar-menu__exit-btn-block">
		<i id="sidebar-menu__exit-btn" class="fa-solid fa-xmark fa-2x"></i>
	</div>
	<!-- 프로필블록 -->
	<div class="sidebar-menu__profile-block">
		
		<c:if test="${headerInfo.userid == null}">
			<h1 id="sidebar-menu__logo" class="logo-text-orange-lg">
				치스토리
			</h1>
			<p class="sidebar-menu__welcome-text">
				치스토리에 오신 것을<br/>
				환영합니다!
			</p>
			<a href="${pageContext.request.contextPath}/login" class="login-btn btn-large-solid">로그인</a>
			<a href="${pageContext.request.contextPath}/signup" class="signup-btn btn-large-hollow">회원가입</a>
		</c:if>
		<c:if test="${headerInfo.userid != null}">
			<div class="profile">
				<div class="profile__img">
					<c:if test="${headerInfo.backgroundColor != null && headerInfo.backgroundColor eq 'fa-seedling'}"><i class="fa-solid fa-seedling" id="header-seedling"></i></c:if>
					<c:if test="${headerInfo.backgroundColor != null && headerInfo.backgroundColor eq 'fa-pagelines'}"><i class="fa-brands fa-pagelines" id="header-pagelines"></i></c:if>
					<c:if test="${headerInfo.backgroundColor != null && headerInfo.backgroundColor eq 'fa-tree'}"><i class="fa-solid fa-tree" id="header-tree"></i></c:if>
					<c:if test="${headerInfo.doctor != null}"><i class="fa-solid fa-circle-check docterCheck" id="header-doctor"></i></c:if>
				</div>
				<div class="profile__nametag">
					<p class="name">
						<span id="username">${headerInfo.name}</span> 님
					</p>
					<a href="${pageContext.request.contextPath}/myPage/myPointList">
						<p class="mypoint">
							<span class="mypoint__icon">
								<i class="fa-solid fa-circle-dollar-to-slot"></i>
							</span>
							<span class="mypoint__amount">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${headerInfo.point}" />
							</span>
							<span class="mypoint__arrow-right">
								<i class="fa-solid fa-chevron-right"></i>
							</span>
						</p>
					</a>
				</div>
			</div>
			<a href="${pageContext.request.contextPath}/myPage/main" class="mypage-btn btn-large-hollow-white" style="margin-bottom:-1rem;">
				<i class="mypage-btn__icon fa-solid fa-user"></i>
				마이페이지
			</a>
			<a href="${pageContext.request.contextPath}/logout" class="mypage-btn btn-large-hollow-white" style="background-color:#f26522; text-decoration:none; color:white">
				<i class="fa-solid fa-arrow-right-from-bracket"></i>
				로그아웃
			</a>
		</c:if>
	</div>

	<!-- 옅은 회색 분리막대 -->
	<div class="thick-divider"></div>
	
	<!-- 메뉴블록 -->
	<nav class="sidebar-menu__nav-block">
		<ul class="menu-list">
			<a class="menu-btn" href="${pageContext.request.contextPath}/treatment/main">
				<span class="menu-btn__icon"><i class="fa-solid fa-tooth"></i></span>
				<li class="menu-btn__name">치료 내역 모아보기</li>
			</a>
			<a id="goReservation" class="menu-btn" href="${pageContext.request.contextPath}/reservation/main">
				<span class="menu-btn__icon"><i class="fa-solid fa-clock"></i></span>
				<li class="menu-btn__name">진료 예약하기</li>
			</a>
			<a class="menu-btn" href="${pageContext.request.contextPath}/board/boardList">
				<span class="menu-btn__icon"><i class="fa-solid fa-comments"></i></span>
				<li class="menu-btn__name">커뮤니티</li>
			</a>
		</ul>
	</nav>
</aside>
<script>
	$('#goReservation').click(() => {
		// console.log("$('#goReservation').click()");
		window.localStorage.removeItem('searchingKeyword_LS');
	});

	$(function(){
		$("#header__hamburger-btn").on("click", function(){
			$(".sidebar-menu").removeClass("hidden");
			$(".sidebar-menu").addClass("revealed");
			$("body").addClass("overflow-hidden");
		});
		
		$("#sidebar-menu__exit-btn").on("click", function(){
			$("body").removeClass("overflow-hidden");
			$(".sidebar-menu").removeClass("revealed");
			$(".sidebar-menu").addClass("hidden");
		});

	})
	
</script>
