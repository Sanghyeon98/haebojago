<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2023-11-27
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>회원가입 폼</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>

    </style>
</head>
<body>
<c:import url="header.jsp" />

<div class="container mt-5">
    <h2 class="text-center mb-4">회원가입</h2>
    <form id="signupForm" action="/signup/register" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" required>
        </div>
        <div class="mb-3">
            <label for="pwd" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="pwd" name="pwd" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">이름</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">이메일</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">가입하기</button>
        </div>
    </form>
</div>

<!-- 부트스트랩 JS 포함 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $('#signupForm').submit(function(e){
            e.preventDefault(); // 기본 폼 전송 동작을 막습니다.

            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: $(this).serialize(), // 폼 데이터를 직렬화하여 전송합니다.
                success: function(response){
                    // 회원가입 요청이 성공했을 때의 동작
                    console.log(response);
                    alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
                    window.location.href = "/loginForm"; // 로그인 페이지로 이동합니다.
                },
                error: function(xhr, status, error){
                    // 회원가입 요청이 실패했을 때의 동작
                    alert("회원가입에 실패했습니다. 다시 시도해주세요.");
                }
            });
        });
    });
</script>
</body>
</html>
