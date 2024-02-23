<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib  prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header class="p-3 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <div class="p-2 flex-grow-1">
                <a href="/" class="d-flex align-items-center mb-9 mb-lg-0 text-white text-decoration-none">
                    <img src="images/logo-haebojago.png" alt="logo" width="100px" height="100px">
                    <h1>Linked-By-Word</h1>
                </a>
            </div>

            <div class="text-end p-2">
                <c:choose>
                    <c:when test="${not empty sessionScope.user and not empty sessionScope.user.id}">
                        <button id="logoutButton" type="button" class="btn btn-outline-light me-2" style="font-weight: bold; " >Logout</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="btn btn-outline-light me-2" style="font-weight: bold" onclick="location.href='/loginForm';">Login</button>
                        <button type="button" class="btn" style="background-color: #FEE500; font-weight: bold" onclick="location.href='/signup';">Sign-up</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>
<script>
    $(document).ready(function(){
        // 로그아웃 버튼 클릭 시
        $("#logoutButton").click(function(){
            $.ajax({
                type: "POST", // 요청 메소드 타입
                url: "/loginForm/logout", // 로그아웃을 처리하는 컨트롤러의 URL
                success: function(response) { // 요청이 성공할 경우 실행될 콜백 함수
                    // 서버로부터 받은 응답을 확인하여 필요한 동작 수행
                    console.log(response); // 응답을 콘솔에 출력 (예시)
                    // sessionStorage에서 사용자 정보 삭제
                    sessionStorage.removeItem("user");

                    // 여기에 로그아웃 성공 후의 동작 추가 (예시: 페이지 새로고침 등)
                    window.location.reload(); // 페이지 새로고침
                },
                error: function(xhr, status, error) { // 요청이 실패할 경우 실행될 콜백 함수
                    // 에러 처리
                    console.error(xhr, status, error); // 에러 로그 출력 (예시)
                    // 여기에 에러 발생 시의 동작 추가
                }
            });
        });
    });
</script>