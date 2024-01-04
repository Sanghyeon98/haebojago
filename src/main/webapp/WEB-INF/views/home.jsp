<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2023-11-23
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

</style>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
<section class="w-75" style=" margin: 0 auto; display: flex">
    <div class="w-50 p-3">
        <form >
            <div><select class="form-select" aria-label="Default select example">
                <option selected>입력할 언어</option>
                <option value="ko">한국어</option>
                <option value="En">영어</option>
                <option value="Jp">일본어</option>
                <option value="ch">중국어</option>
            </select></div>
            <div style="width: auto" class="mt-2 w-auto"><input class="w-100" type="text" style="height: 300px"  placeholder="단어를 입력해주세요"></div>
            <div class="mt-2 w-auto d-flex flex-row-reverse"><input type="button" class="btn btn-warning w-50" style="background-color: #FEE500;font-weight: bold" value="번역 하기"></div>
        </form>
    </div>
    <div class="w-50 p-3">
        <form >
            <div><select class="form-select" aria-label="Default select example">
                <option selected>입력할 언어</option>
                <option value="ko">한국어</option>
                <option value="En">영어</option>
                <option value="Jp">일본어</option>
                <option value="ch">중국어</option>
            </select></div>
            <div style="width: auto" class="mt-2 w-auto"><input class="w-100" type="text" style="height: 300px"  readonly></div>
            <div class="mt-2 w-auto d-flex flex-row-reverse"><input type="button" class="btn btn-warning w-50" style="background-color: #FEE500;font-weight: bold " value="단어장에 추가"></div>
        </form>
    </div>

</section>
<section class="w-75" style=" margin: 0 auto">
    <div class="w-auto mx-auto mt-5 row justify-content-between text-center align-items-center">
        <div class="d-flex align-items-center col">
            <div class="align-items-center" style="margin-right: 10px"><input  type="checkbox" style="width: 30px; height: 30px" id="check"></div>
            <div><a href="#" class="ml-5" style="color: black; text-decoration-line: none">선택 삭제</a></div>
        </div>
        <div class="col">
            <h2>검색한 단어장</h2>
        </div>
        <div class="col d-flex flex-row-reverse">
            <input type="text">
            <input type="button" value="검색">
        </div>
    </div>
</section>
    <div class="w-75 text-center row" style=" margin: 0 auto ">
        <div class="col">
        <table class="table">
            <thead class="table-dark">
            <tr>
               <th>NO</th>
               <th>단어</th>
               <th>뜻</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td>2</td>
                <td>3</td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td>2</td>
                <td>3</td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td>2</td>
                <td>3</td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td>2</td>
                <td>3</td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td>2</td>
                <td>3</td>
            </tr>
            </tbody>
        </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="table-dark">
                <tr>
                    <th>NO</th>
                    <th>단어</th>
                    <th>뜻</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td>2</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td>2</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td>2</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td>2</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td>2</td>
                    <td>3</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="w-75" style="margin: 0 auto">
        <nav class="" aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</html>
