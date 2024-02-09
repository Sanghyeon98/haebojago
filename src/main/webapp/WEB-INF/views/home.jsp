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

</head>

<body>
<c:import url="header.jsp" />
<%--    section      --%>
<section class="w-75" style=" margin: 0 auto; display: flex">
    <div class="w-50 p-3">
        <form >
            <div><select class="form-select" aria-label="Default select example" name="source">
                <option selected>입력할 언어</option>
                <option value="ko">한국어</option>
                <option value="en">영어</option>
                <option value="jp">일본어</option>
                <option value="ch">중국어</option>
            </select></div>
            <div style="width: auto" class="mt-2 w-auto"><input class="w-100" type="text" style="height: 300px"  placeholder="단어를 입력해주세요"></div>
            <div class="mt-2 w-auto d-flex flex-row-reverse"><input id="tarnslate" type="button" class="btn btn-warning w-50" style="background-color: #FEE500;font-weight: bold" value="번역 하기"></div>
        </form>
    </div>
    <div class="w-50 p-3">
        <form >
            <div><select class="form-select" aria-label="Default select example" name="target">
                <option selected>번역할 언어</option>
                <option value="ko">한국어</option>
                <option value="en">영어</option>
                <option value="jp">일본어</option>
                <option value="ch">중국어</option>
            </select></div>
            <div style="width: auto" class="mt-2 w-auto"><input id="inputTranslated" class="w-100" type="text" style="height: 300px"  readonly></div>
            <div class="mt-2 w-auto d-flex flex-row-reverse"><input id="add" type="button" class="btn btn-warning w-50" style="background-color: #FEE500;font-weight: bold " value="단어장에 추가"></div>
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
        <table class="table" id="leftTable">
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
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>
        </div>
        <div class="col">
            <table class="table" id="rightTable">
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
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input  type="checkbox" style="width: 20px; height: 20px" ></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

<%--<div class="w-75 text-center row" style=" margin: 0 auto ">--%>
<%--    <div class="col">--%>
<%--        <table id="leftTable" class="table">--%>
<%--            <!-- 왼쪽 테이블의 헤더 등은 여기에 작성 -->--%>
<%--        </table>--%>
<%--    </div>--%>
<%--    <div class="col">--%>
<%--        <table id="rightTable" class="table">--%>
<%--            <!-- 오른쪽 테이블의 헤더 등은 여기에 작성 -->--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</div>--%>
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
<script>

    $(document).ready(function() {
        // 페이지 로드 시 리스트를 가져오는 함수 호출
        getList();

        function getList() {
            $.ajax({
                type: 'POST',
                url: '/getAll',
                dataType: 'json',
                success: function (response) {
                    console.log(response);
                    // populateTable 함수 호출
                    populateTable(response);
                },
                error: function (xhr, status, error) {
                    // 요청이 실패한 경우 처리
                    console.error('Failed to get list:', error);
                }
            });
        }

        function populateTable(data) {
            // 데이터가 배열인지 확인
            if (!data || !Array.isArray(data.dataList) || data.dataList.length === 0) {
                console.error('Data is not a non-empty array');
                // 데이터가 배열이 아니거나 비어있는 경우 처리
                return;
            }

            // 왼쪽 테이블과 오른쪽 테이블 초기화
            $('#leftTable tbody').empty();
            $('#rightTable tbody').empty();

            // 배열의 각 요소를 반복하여 테이블에 추가
            var dataList = data.dataList;
            for (var index = 0; index < dataList.length; index++) {
                var item = dataList[index];
                // 새로운 행 생성
                var newRow = '<tr>' +
                    '<td><input type="checkbox" style="width: 20px; height: 20px"></td>' +
                    '<td>' + item.word + '</td>' +
                    '<td>' + item.meaning + '</td>' +
                    '</tr>';

                // 왼쪽 테이블에 추가 (처음 10개 항목)
                if (index < 10) {
                    $('#leftTable tbody').append(newRow);
                } else {
                    // 오른쪽 테이블에 추가 (나머지 항목)
                    $('#rightTable tbody').append(newRow);
                }
            }
        }




                // 번역 버튼 클릭 이벤트 핸들러
        $('#tarnslate').click(function() {

            // 입력한 단어와 선택된 언어 가져오기
            var word = $('input[type="text"]').val();
            var sourceLanguage = $('select[name="source"]').val();
            var targetLanguage = $('select[name="target"]').val();

            // Ajax 요청 보내기
            $.ajax({
                type: 'POST',
                url: '/translate',
                data: {
                    s: word,
                    source: sourceLanguage,
                    target: targetLanguage
                },
                success: function(response) {
                    // 서버로부터 받은 JSON 데이터 콘솔에 출력
                    const jsonObj = JSON.parse(response);
                    var translatedText = jsonObj.message.result.translatedText;
                    console.log('Translated text:', translatedText);
                    $('#inputTranslated').val(translatedText);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패한 경우 처리
                    console.error('Failed to translate:', error);
                }
            });
        });
        function addWordToTable(word, meaning) {
            // 새로운 행을 생성
            var newRow = '<tr>' +
                '<td><input type="checkbox" style="width: 20px; height: 20px"></td>' +
                '<td>' + word + '</td>' +
                '<td>' + meaning + '</td>' +
                '</tr>';

            // tbody에 새로운 행 추가
            $('table tbody').append(newRow);
        }
        //단어장에 추가
        $('#add').click(function() {
                // 입력한 단어와 선택된 언어 가져오기
                var word = $('input[type="text"]').val(); //word
                var sourceLanguage = $('select[name="source"]').val();//wordType
                var targetLanguage = $('select[name="target"]').val();//meaningType
                var inputTranslated = $('#inputTranslated').val();//meaning


                // Ajax 요청 보내기
                $.ajax({
                    type: 'POST',
                    url: '/add',
                    dataType: 'json',
                    data: {
                        word: word,
                        wordType: sourceLanguage,
                        meaning: inputTranslated,
                        meaningType: targetLanguage,
                    },
                    success: function (response) {
                        console.log(response);

                        addWordToTable(word, inputTranslated);
                    },
                    error: function (xhr, status, error) {
                        // 요청이 실패한 경우 처리
                        console.error('Failed to translate:', error);
                    }
                });
        });
    });

</script>
</html>
