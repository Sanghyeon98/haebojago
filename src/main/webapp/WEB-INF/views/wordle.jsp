<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2023-11-23
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

</style>
<html>
<head>
    <title>HABOJAGO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        input{
            width: 100px;
            height: 100px;
            font-size:90px;
            text-align: center;
        }
    </style>
</head>

<body>
    <header class="p-3 text-bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <div class="p-2 flex-grow-1">
                <a href="/" class="d-flex align-items-center mb-9 mb-lg-0 text-white text-decoration-none">
                    <img src="images/logo-haebojago.png" alt="logo" width="100px" height="100px">
                   <h1>HAEBOJAGO</h1>
                </a>
                </div>

                <div class="text-end p-2">
                    <button type="button" class="btn btn-outline-light me-2" style="font-weight: bold">Login</button>
                    <button type="button" class="btn" style="background-color: #FEE500; font-weight: bold">Sign-up</button>
                </div>
            </div>
        </div>
    </header>
<%--    section      --%>
<section class="w-75" style=" margin: 0 auto; ">
    <div>
        <input class="input" type="text" maxlength="1" oninput="handleInput(this, 1)" />
        <input class="input" type="text" maxlength="1" oninput="handleInput(this, 2)" />
        <input class="input" type="text" maxlength="1" oninput="handleInput(this, 3)" />
        <input class="input" type="text" maxlength="1" oninput="handleInput(this, 4)" />
        <input class="input" type="text" maxlength="1" oninput="handleInput(this, 5)" />
    </div>
<%--    <div>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--        <input class="input" type="text" name="singleValueInput"/>--%>
<%--    </div>--%>
    <button id="submit">제츌</button>

</section>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    let result ='asdfg';
    document.getElementById('submit').addEventListener('click',function (){
        let input = document.querySelectorAll('.input');
        for(let i=0; i<5; i++){
        if(input[i].value == result[i]){
            input[i].style.background='green';
        }else if(result.includes(input[i].value)){
            input[i].style.background='yellow';
            input[i].style.color='white';
        }else{
            input[i].style.background ='lightgrey';
        }
        }
    })
    function handleInput(currentInput, nextIndex) {
        var inputValue = currentInput.value;

        if (inputValue.length === 1) {
            // 입력 값이 있을 때
            if (nextIndex <= 5) {
                // 다음 입력 필드로 이동
                var nextInput = document.getElementsByClassName("input")[nextIndex];
                nextInput.focus();
            }
        } else {
            // 입력 값이 없을 때
            if (nextIndex > 1) {
                // 이전 입력 필드로 이동
                var prevInput = document.getElementsByClassName("input")[nextIndex - 2];
                prevInput.focus();
            }
        }
    }
    // $('#submit').on('click',function (){
    //
    // })
</script>
</html>
