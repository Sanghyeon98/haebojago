<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2023-11-23
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib  prefix= "fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <style>
        /* 버튼에 호버 효과를 추가합니다. */
        #ExcelFile:hover, #wordFile:hover {
            background-color: #ffcc00; /* 호버 시 배경색 변경 */
            color: black; /* 호버 시 텍스트 색상 변경 */
            cursor: pointer; /* 호버 시 커서 모양 변경 */
        }
    </style>
    <title>HaeBojaGO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- 사용자 정의 CSS 파일 또는 스타일 태그 -->
</head>

<body>
<c:import url="header.jsp" />
<%--    section      --%>
<section class="w-75" style=" margin: 0 auto; display: flex">
    <div class="w-50 p-3">
        <form >
            <div><select class="form-select" aria-label="Default select example" name="source">
                <option value="en" selected>입력할 언어- 기본 영어</option>
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
                <option value="ko" selected>번역할 언어- 기본 한국어</option>
                <option value="ko">한국어</option>
                <option value="en">영어</option>
                <option value="jp">일본어</option>
                <option value="ch">중국어</option>
            </select></div>
            <div style="width: auto" class="mt-2 w-auto"><input id="inputTranslated" class="w-100" type="text" style="height: 300px" readonly  ></div>
            <div class="mt-2 w-auto d-flex flex-row-reverse"><input id="LoginAdd" type="button" class="btn btn-warning w-50" style="background-color: #FEE500;font-weight: bold " value="단어장에 추가"></div>
            <div class="mt-2 w-auto d-flex flex-row-reverse"><input id="noLoginAdd" type="button" class="btn btn-warning w-50" style="background-color: #fea900;font-weight: bold " value="단어장에 추가"></div>
        </form>
    </div>

</section>
<section class="w-75" style=" margin: 0 auto 10px; text-align: center">
    <div class="col">
        <h2 style="margin-bottom: -40px">검색한 단어장</h2>
    </div>
    <div class="w-auto mx-auto mt-5 row justify-content-between text-center align-items-center">
        <div class="d-flex align-items-center col optionBar">
            <div class="align-items-center optionBar" style="margin-right: 10px; margin-left: 20px"><input  type="checkbox" style="width: 30px; height: 30px" id="check"></div>
            <div class="optionBar"><a id="deleteAll" href="#" class="ml-5" style="color: black; text-decoration-line: none; font-weight: bold;">선택 삭제</a></div>
        </div>
        <div class="col d-flex align-items-center optionBar">
            <select class="form-select optionBar" aria-label="Default select example" name="amount" style="margin-right: 10px; width: 30%" >
                <option value="10" selected>단어의 수</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="40">40</option>
                <option value="50">50</option>
                <option value="100">100</option>
            </select>
            <select class="form-select optionBar" aria-label="Default select example" name="type" style="  width: 35%">
                <option value="" selected>단어의 타입</option>
                <option value="ko">한국어</option>
                <option value="en">영어</option>
                <option value="jp">일본어</option>
                <option value="ch">중국어</option>
            </select>
            <div class="input-group optionBar" style="width: 60%">
                <input type="text" class="form-control" id="search-input">
                <button id="searchWord" class="btn btn-warning" style="background-color: #FEE500; font-weight: bold;">검색</button>
            </div>
        </div>
    </div>
</section>
    <div id="searchTable" class="w-75 text-center row" style=" margin: 0 auto ">
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

                </tbody>
            </table>
        </div>
    </div>

    <div class="w-75" style="margin: 0 auto">
        <nav class="" aria-label="Page navigation example">
            <ul class="pagination justify-content-center">

            </ul>
        </nav>
    </div>
<section class="w-75" style=" margin: 0 auto 10px; text-align: center">
<div class="mt-2 w-auto d-flex flex-row-reverse"><input id="ExcelFile" type="button" class="btn btn-warning w-50 ExcelFile" style="background-color: #15963a;font-weight: bold; color: white; " value="Excel파일로">
    <input id="wordFile" type="button" class="btn btn-warning w-50" style="background-color: #32aafa;font-weight: bold; color: white" value="word파일로"></div>
</section>
<div>
<%--    <button id="generatePDFButton">PDF 생성 및 다운로드</button>--%>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/xlsx@0.18.12/dist/xlsx.full.min.js"></script>
<script>
    let page=1;
    let amount=10;


    $(document).ready(function() {
        // 페이지 로드 시 리스트를 가져오는 함수 호출
        $('select[name="amount"]').change(function() {
            // 선택된 옵션의 값을 가져옵니다.
            let selectedValue = $(this).val();
            // amount 변수를 선택된 값으로 업데이트합니다.
            amount = parseInt(selectedValue);
            // console.log(amount);
            page =1;
            getList(page,amount);
        });

        getList(page,amount);

        function getList() {
            $.ajax({
                type: 'GET',
                url: '/getAll/'+page+'/'+amount,
                dataType: 'json',
                success: function(response) {
                    // console.log(response);
                    // populateTable 함수 호출
                    populateTable(response);
                    createPagination(response.total);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패한 경우 처리
                    console.error('Failed to get list:', error);
                }
            });
        }

        function populateTable(response) {
            // 왼쪽 테이블과 오른쪽 테이블 초기화
            $('#leftTable tbody').empty();
            $('#rightTable tbody').empty();
            wordList=[];

            // 서버로부터 받은 데이터
            let dataList = response.dataList;


            if (dataList && dataList.length > 0) {

                dataList.forEach(function(item) {
                    let wordItem = {
                        word: item.word,
                        meaning: item.meaning
                    };
                    wordList.push(wordItem);
                });

                // console.log(wordList);
                $.each(dataList, function(index, item) {
                    let newRow = '<tr>' +
                        '<td><input type="checkbox" style="width: 20px; height: 20px" value="' + item.wordId + '"></td>' +
                        '<td>' + item.word + '</td>' +
                        '<td>' + item.meaning + '</td>' +
                        '</tr>';

                    if (index < dataList.length / 2) {
                        // 왼쪽 테이블에 추가
                        $('#leftTable tbody').append(newRow);
                    } else {
                        // 오른쪽 테이블에 추가
                        $('#rightTable tbody').append(newRow);
                    }
                    createPagination(response.total)
                });
            } else {
                // dataList가 비어있는 경우
                for (let i = 0; i < 5; i++) {
                    let emptyRow = '<tr>';
                    if (i < wordList.length) {
                        // wordList에 저장된 단어와 의미를 가져와서 행에 추가
                        emptyRow += '<td><input type="checkbox" style="width: 20px; height: 20px" value=""></td>' +
                            '<td>' + wordList[i].word + '</td>' +
                            '<td>' + wordList[i].meaning + '</td>';
                    } else {
                        // wordList에 저장된 단어가 없는 경우 빈 행을 추가
                        emptyRow += '<td><input type="checkbox" style="width: 20px; height: 20px" value=""></td>' +
                            '<td></td>' +
                            '<td></td>';
                    }
                    emptyRow += '</tr>';

                    // 왼쪽 테이블에 추가
                    $('#leftTable tbody').append(emptyRow);
                    // 오른쪽 테이블에 추가
                    $('#rightTable tbody').append(emptyRow);
                }
            }
        }

        function createPagination(totalPage) {
            let totalPages = Math.ceil(totalPage / amount); // 전체 페이지 수 계산
            let endNum = Math.ceil(page / 5.0) * 5; // 끝 페이지 번호 계산
            let startNum = endNum - 4; // 시작 페이지 번호 계산
            let prev = startNum != 1; // 이전 페이지 존재 여부
            let next = endNum < totalPages; // 다음 페이지 존재 여부
            let str = "";

            if (endNum > totalPages) {
                endNum = totalPages;
            }

            if (prev) {
                str += '<li class="page-item"><a class="page-link" href="' + (startNum - 1) + '" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
            }

            for (let i = startNum; i <= endNum; i++) {
                if (page == i) {
                    str += '<li class="page-item active page-link" style="background-color: #FEE500;font-weight: bold; color: black; border: none;">' + i + '</a></li>';
                } else {
                    str += '<li class="page-item"><a class="page-link" href="' + i + '">' + i + '</a></li>';
                }
            }

            if (next) {
                str += '<li class="page-item"><a class="page-link" href="' + (endNum + 1) + '" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
            }

            let pagination = $('.pagination');
            pagination.empty(); // 기존의 페이징 요소들을 비웁니다.
            pagination.html(str);
        }
        $('.pagination').on('click', "a.page-link", function (e) {
            e.preventDefault();
            let pageNum = $(this).attr("href");
            if (page != pageNum) {
                page = parseInt(pageNum);

                let keyword = $('#search-input').val(); // 입력된 단어
                let type = $('select[name="type"]').val(); // 선택된 타입

                let url = '/getAll/' + page + '/' + amount;

                // 검색어와 타입이 있는 경우 URL에 추가
                if (keyword || type) {
                    url += '?type=' + type + '&keyword=' + keyword;
                }

                // AJAX 요청 보내기
                $.ajax({
                    type: 'GET',
                    url: url,
                    success: function(response) {
                        // 서버로부터 받은 데이터를 이용하여 화면에 출력하거나 다른 작업 수행
                        // console.log(response);
                        // 검색 결과를 화면에 표시하는 함수 호출
                        populateTable(response);
                        // 검색 결과에 맞는 페이지네이션 생성
                        createPagination(response.total);
                    },
                    error: function(xhr, status, error) {
                        // 요청이 실패한 경우 처리
                        console.error('Failed to get list:', error);
                    }
                });
            } else {
                // 현재 페이지와 클릭한 페이지가 같으면 아무 동작도 하지 않음
                return false;
            }
        });
        // 세션 정보 확인
        let user = sessionStorage.getItem("user");
        // console.log(user);
        if (user) {
            // 유저 정보가 있는 경우
            $("#LoginAdd").show(); // add 버튼 표시
            $("#noLoginAdd").hide(); // noLoginAdd 버튼 숨김
            $(".optionBar").show();

        } else {
            // 유저 정보가 없는 경우
            $("#LoginAdd").hide(); // add 버튼 숨김
            $("#noLoginAdd").show(); // noLoginAdd 버튼 표시
            $(".optionBar").hide();
        }

        // 번역 버튼 클릭 이벤트 핸들러
        $('#tarnslate').click(function() {

            // 입력한 단어와 선택된 언어 가져오기
            let word = $('input[type="text"]').val();
            let sourceLanguage = $('select[name="source"]').val();
            let targetLanguage = $('select[name="target"]').val();

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
                    let translatedText = jsonObj.message.result.translatedText;
                    // console.log('Translated text:', translatedText);
                    $('#inputTranslated').val(translatedText);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패한 경우 처리
                    console.error('Failed to translate:', error);
                }
            });
        });

        let wordList = [];

        $('#noLoginAdd').click(function() {

            if (wordList.length >= 10) {
                alert("단어를 추가하려면 로그인이 필요합니다.");
                return;
            }

            let word = $('input[type="text"]').val();
            // console.log(word);

            let meaning = $('#inputTranslated').val();

            // 번역된 의미가 없는 경우
            if (meaning.trim() === '') {
                alert("번역된 의미가 없습니다. 번역 버튼을 먼저 클릭하여 단어를 번역해주세요.");
                return; // 함수 종료
            }

            // 단어와 의미를 객체로 묶어서 리스트에 저장
            let wordItem = {
                word: word,
                meaning: meaning
            };

            // 리스트에 저장
            wordList.push(wordItem);

            // wordList의 길이가 10인 경우 알림을 띄웁니다.
            if (wordList.length === 10) {
                alert("단어를 추가하려면 로그인이 필요합니다.");
            }

            // console.log(wordList);
            updateTable();
        });

        function updateTable() {
            // 테이블의 tbody를 선택하여 비웁니다.
            $('#leftTable tbody').empty();
            $('#rightTable tbody').empty();

            // 테이블에 기본적으로 5개의 빈 행을 만듭니다.
            for (let i = 0; i < 5; i++) {
                let emptyRow = '<tr>' +
                    '<td><input type="checkbox" style="width: 20px; height: 20px" value=""></td>' +
                    '<td></td>' +
                    '<td></td>' +
                    '</tr>';

                // 왼쪽 테이블에 추가
                $('#leftTable tbody').append(emptyRow);
                // 오른쪽 테이블에도 같은 내용을 추가
                $('#rightTable tbody').append(emptyRow);
            }

            // wordList의 각 항목의 텍스트 값을 테이블에 추가합니다.
            wordList.forEach(function(wordItem, index) {
                // 각 항목의 텍스트 값을 가져옵니다.
                let wordText = wordItem.word;
                let meaningText = wordItem.meaning;

                // 인덱스에 따라 왼쪽 또는 오른쪽 테이블의 해당 행에 텍스트를 추가합니다.
                if (index % 2 === 0) {
                    $('#leftTable tbody tr').eq(index / 2).find('td:nth-child(2)').text(wordText);
                    $('#leftTable tbody tr').eq(index / 2).find('td:nth-child(3)').text(meaningText);
                } else {
                    $('#rightTable tbody tr').eq(Math.floor(index / 2)).find('td:nth-child(2)').text(wordText);
                    $('#rightTable tbody tr').eq(Math.floor(index / 2)).find('td:nth-child(3)').text(meaningText);
                }
            });
        }


        //단어장에 추가
        $('#LoginAdd').click(function() {
                // 입력한 단어와 선택된 언어 가져오기
            let word = $('input[type="text"]').val(); //word
            let sourceLanguage = $('select[name="source"]').val();//wordType
            let targetLanguage = $('select[name="target"]').val();//meaningType
            let inputTranslated = $('#inputTranslated').val();//meaning

            if (inputTranslated.trim() === '' && word.trim() ===``) {
                alert("번역된 값이 없습니다.")
                return; // 값이 비어있으면 요청을 보내지 않고 함수 종료
            }

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
                        // console.log(response);
                        page=1;
                        getList(page,amount);
                    },
                    error: function (xhr, status, error) {
                        // 요청이 실패한 경우 처리
                        console.error('Failed to translate:', error);
                    }
                });
        });


        $('#check').change(function() {
            let isChecked = $(this).prop('checked');

            // 모든 체크박스의 상태를 전체 선택 체크박스와 동일하게 설정합니다.
            $('input[type="checkbox"]').prop('checked', isChecked);
        });

        $('#deleteAll').click(function(e) {
            e.preventDefault();
            let selectedWordIds = [];

            // 모든 체크박스에 대해 반복
            $('input[type="checkbox"]:checked').each(function() {
                // 체크된 체크박스의 value, 즉 wordId를 배열에 추가
                selectedWordIds.push($(this).val());
            });

            // 선택된 단어가 없는 경우에는 알림을 띄우고 함수 종료
            if (selectedWordIds.length === 0) {
                alert('선택된 단어가 없습니다.');
                return;
            }

            // 사용자에게 삭제를 진행할지 확인하는 메시지를 표시
            let confirmDelete = confirm('선택된 단어를 삭제하시겠습니까?');

            // 사용자가 확인을 선택한 경우에만 삭제 요청을 보냄
            if (confirmDelete) {
                $.ajax({
                    type: 'DELETE',
                    url: '/delete',
                    contentType: 'application/json',
                    data: JSON.stringify(selectedWordIds), // 선택된 단어들의 wordId를 JSON 형식으로 전송
                    success: function(response) {
                        // 삭제 요청이 성공한 경우, 서버로부터 받은 응답 처리
                        console.log(response);
                        alert('선택된 단어가 성공적으로 삭제되었습니다.');

                        page = 1;

                        // 삭제가 성공했으므로 첫 번째 페이지의 내용을 다시 가져옴
                        getList(page, amount);
                    },
                    error: function(xhr, status, error) {
                        // 삭제 요청이 실패한 경우 처리
                        console.error('Failed to delete selected words:', error);
                        alert('선택된 단어를 삭제하는데 실패했습니다.');
                    }
                });
            }
        });

        $('#searchWord').click(function() {
            // 입력된 단어와 선택된 타입 가져오기
            let keyword = $('#search-input').val(); // 입력된 단어
            let type = $('select[name="type"]').val(); // 선택된 타입

            let url = '/getAll/' + page + '/' + amount;

            // 검색어와 타입이 있는 경우 URL에 추가
            if (keyword || type) {
                url += '?type=' + type + '&keyword=' + keyword;
            }

            // AJAX 요청 보내기
            $.ajax({
                type: 'GET',
                url: url,
                success: function(response) {
                    // 서버로부터 받은 데이터를 이용하여 화면에 출력하거나 다른 작업 수행
                    // console.log(response);
                    // 검색 결과를 화면에 표시하는 함수 호출
                    populateTable(response);
                    // 검색 결과에 맞는 페이지네이션 생성
                    createPagination(response.total);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패한 경우 처리
                    console.error('Failed to search words:', error);
                }
            });
        });

        // 이 오류는 서버로부터 받은 응답(response)의 형식이 Blob인데, jQuery AJAX 요청에서 기본적으로는 텍스트 형식으로 응답을 처리하려고 시도하기 때문에 발생합니다.
        //
        //     해결하기 위해서는 AJAX 요청의 responseType을 Blob으로 설정해야 합니다. 그러나 jQuery의 AJAX 함수에서는 이러한 설정을 직접 지원하지 않습니다.
        //     따라서 네이티브 JavaScript의 XMLHttpRequest 객체를 사용하여 직접 AJAX 요청을 처리해야 합니다.
        //
        //     아래는 jQuery 대신에 네이티브 JavaScript를 사용하여 AJAX 요청을 보내는 코드입니다.

        $('#ExcelFile').click(function() {


            let requestData = {
                wordList: wordList
            };

            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/downloadExcel', true); // POST 요청으로 변경
            xhr.setRequestHeader('Content-Type', 'application/json'); // 요청 헤더에 Content-Type을 JSON으로 설정
            xhr.responseType = 'blob'; // 응답 형식을 Blob으로 설정

            xhr.onload = function() {
                if (xhr.status === 200) {
                    // 응답이 성공한 경우
                    var blob = xhr.response;
                    var url = window.URL.createObjectURL(blob);
                    var a = document.createElement('a');
                    a.href = url;
                    a.download = 'word_list.xlsx';
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                    window.URL.revokeObjectURL(url);
                } else {
                    // 요청이 실패한 경우
                    console.error('Failed to download Excel file:', xhr.statusText);
                    alert('Failed to download Excel file. Please try again later.');
                }
            };

            xhr.onerror = function() {
                // 요청이 실패한 경우
                console.error('Failed to download Excel file:', xhr.statusText);
                alert('Failed to download Excel file. Please try again later.');
            };

            // JSON.stringify() 함수를 사용하여 요청 데이터를 JSON 형식으로 변환하여 전송
            xhr.send(JSON.stringify(requestData));
        });



        $('#wordFile').click(function() {
            // console.log("wordFile 생성중");
            let requestData = {
                wordList: wordList
            };

            let xhr = new XMLHttpRequest();
            xhr.open('POST', '/downloadWord', true); // POST 요청으로 변경
            xhr.setRequestHeader('Content-Type', 'application/json'); // 요청 헤더에 Content-Type을 JSON으로 설정
            xhr.responseType = 'blob'; // 응답 형식을 Blob으로 설정

            xhr.onload = function() {
                if (xhr.status === 200) {
                    // 응답이 성공한 경우
                    let blob = xhr.response;
                    let url = window.URL.createObjectURL(blob);
                    let a = document.createElement('a');
                    a.href = url;
                    a.download = 'word_list.docx';
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                    window.URL.revokeObjectURL(url);
                } else {
                    // 요청이 실패한 경우
                    console.error('Failed to download Word file:', xhr.statusText);
                    alert('Failed to download Word file. Please try again later.');
                }
            };

            xhr.onerror = function() {
                // 요청이 실패한 경우
                console.error('Failed to download Word file:', xhr.statusText);
                alert('Failed to download Word file. Please try again later.');
            };

            // JSON.stringify() 함수를 사용하여 요청 데이터를 JSON 형식으로 변환하여 전송
            xhr.send(JSON.stringify(requestData));
        });



    });



</script>
</html>
