기본 커넥션 설정입니다.
상황에 맞게 수정이 필요합니다.
# dbconnection : connection.php
$host = "localhost";
$user = "root";
$pw = "123123";
$dbName = "planner"

Planner.sql 파일이 기본 더미데이터가 포함된 덤프파일입니다.

더미 유저로는 1@naver.com, 2@naver.com, 3@naver.com, 4@naver.com이 있으며
기본 비밀번호는 123123으로 동일합니다.

Apache, PHP, MySQL을 사용한 프로젝트입니다.

main.php 가 최초 진입점입니다.
Project폴더 속 내용을 Apache24/htdocs 폴더로 복사한 뒤
http://localhost/main.php를 통해 접속합니다.