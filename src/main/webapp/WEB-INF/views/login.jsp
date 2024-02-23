<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
<c:import url="header.jsp" />

<section class="w-50 mt-5" style=" margin: 0 auto;">
    <form id="loginForm" class="p-3 border rounded" style="background-color: #f8f9fa;" method="post" >
        <h2 class="text-center mb-4">Login</h2>
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" required>
        </div>
        <div class="mb-3">
            <label for="pwd" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="pwd" name="pwd" required>
        </div>
        <div class="text-center mb-3">
            <button type="submit" class="btn btn-outline-secondary" style="background-color: #FEE500; font-weight: bold;">Login</button>
            <a href="/signup" class="btn btn-outline-light me-2 btn-hover" style="background-color: black; color: white; font-weight: bold;">Sign Up</a>
        </div>
    </form>
</section>

<div class="w-75" style="margin: 0 auto">
    <nav class="" aria-label="Page navigation example">
        <!-- Your pagination content -->
    </nav>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('#loginForm').submit(function(e) {
            e.preventDefault(); // 폼 제출 방지
            $.ajax({
                url: '/loginForm/login', // 로그인 처리 URL
                type: 'POST',
                dataType: 'json',
                data: $(this).serialize(), // 폼 데이터 직렬화하여 전송
                success: function(response) {
                    // 서버로부터 받은 JSON 데이터 처리
                    console.log(response);
                    // 예시: 메시지 표시
                    alert(response.contents);
                    if (response.msgId === "30") {
                        sessionStorage.setItem("user", JSON.stringify(response)); // 사용자 정보를 JSON 형식으로 변환하여 저장
                    }
                    // 예시: 리다이렉트
                    if (response.msgId === '30') {
                        window.location.href = '/';
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
    });


</script>
</body>
</html>