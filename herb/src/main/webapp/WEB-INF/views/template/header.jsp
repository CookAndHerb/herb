<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
    
    	<!--  
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        	eoleun@kh.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        02-1111-2222
                    </div>
                </div>
                <div class="ht-right">
                    <a href="#" class="login-panel"><i class="fa fa-user"></i>Login</a>
                   	
                    <div class="login-panel">
                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                            <option value='yt' data-image="${pageContext.request.contextPath}/resources/img/flag-1.jpg" data-imagecss="flag yt"
                                data-title="English">KR</option>
                            <option value='yu' data-image="${pageContext.request.contextPath}/resources/img/flag-2.jpg" data-imagecss="flag yu"
                                data-title="Bangladesh">English</option>
                        </select>
                        
                    </div>
                    <div class="top-social">
                        <a href="#"><i class="ti-facebook"></i></a>
                        <a href="#"><i class="ti-twitter-alt"></i></a>
                        <a href="#"><i class="ti-linkedin"></i></a>
                        <a href="#"><i class="ti-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        -->
        <div class="container">
            <div class="inner-header">
                <div class="row">
                
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="index.do" >
                                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    
                     <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">All Categories</button>
                            <div class="input-group">
                                <input type="text" placeholder="키워드를 입력해주세요">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                         <!--  
                            <li class="heart-icon">
                                <a href="#">
                                    <i class="icon_heart_alt"></i>
                                    <span>1</span>
                                </a>
                            </li>
                            <li class="cart-icon">
                                <a href="#">
                                    <i class="icon_bag_alt"></i>
                                    <span>3</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="si-pic"><img src="${pageContext.request.contextPath}/resources/img/select-product-1.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="si-pic"><img src="${pageContext.request.contextPath}/resources/img/select-product-2.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>$60.00 x 1</p>
                                                            <h6>Kabino Bedside Table</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>total:</span>
                                        <h5>$120.00</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="#" class="primary-btn view-card">VIEW CARD</a>
                                        <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
                                    </div>
                                </div>
                            </li>
                            -->
                         <c:choose>
							<c:when test="${not empty sessionScope.member}">
							<span style="color:black;">[${sessionScope.member.userName}]님 환영합니다.</span>
                             <li class="cart-price"><a href="memberLogout.do" style="color:black;">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                             <li class="cart-price"><a href="memberLogin.do" style="color:black;">Login</a></li>
                             <li class="cart-price">|</li>
                             <li class="cart-price"><a href="memberJoin.do" style="color:black;">Join</a></li>
                            </c:otherwise>
                           </c:choose>
                        </ul>
                    </div>  
                    
                    
                </div> 
                
            </div>
            
        </div>
      
        <div class="nav-item" >
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>전체 카테고리</span>
                        <ul class="depart-hover">
                            <li class="active"><a href="#">비타민</a></li>
                            <li><a href="#">홍삼</a></li>
                            <li><a href="#">눈 건강</a></li>
                            <li><a href="#">장 건강</a></li>
                            <li><a href="#">기타</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="index.do">Home</a></li>
                        <li><a href="product.do">Shop</a></li>
                        <li><a href="./blog.html">Cart</a></li>
                        <li><a href="./shop.html">Shop</a></li>
                        <li><a href="cartList.do">Cart</a></li>
                        <li><a href="#">Service Center</a>
                            <ul class="dropdown">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">자주 묻는 질문</a></li>
                                <li><a href="#">질문 게시판</a></li>
                            </ul>
                        </li>
                        <li><a href="./contact.html">Contact</a></li>
                        
                     
                    	<c:choose>
                    	<c:when test="${sessionScope.member.userNum > 0 && sessionScope.member.userNum <= 999}">
                        <li><a href="adminMain.do">admin</a>
                            <ul class="dropdown">
                                <li><a href="#">상품관리</a></li>
                                <li><a href="#">주문관리</a></li>
                                <li><a href="#">회원관리</a></li>
                            </ul>
                        </li>
                       </c:when>
                       <c:when  test="${sessionScope.member.userNum >999}">
                           <li><a href="memberOrder.do">MY HERB</a>
                            <ul class="dropdown">
                                <li><a href="memberOrder.do">주문 조회</a></li>
                                <li><a href="memberUpdate.do">개인 정보 수정</a></li>
                                <li><a href="memberDelete.do">탈퇴하기</a></li>
                            </ul>
                        </li>
                        </c:when>
                           <c:otherwise>
                        </c:otherwise>
                   </c:choose>
                   
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

</body>
</html>