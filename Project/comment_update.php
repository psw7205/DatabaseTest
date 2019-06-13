<!DOCTYPE html>
<html>
    <style>
        html{
            background-image:url("memo1.jpg");
            background-size: auto ;
        }
    </style>
<?php
    include 'session.php';
    include 'checkSignSession.php';
    include 'connection.php';

    $id = $_POST['id'];
    $content = $_POST['content']; //입력한 제목과 내용을 각각의 변수에 대입


        $sql = "UPDATE comment SET content = '{$content}'
        WHERE id = {$id}";

        $result = $dbConnect->query($sql);

        if($result){
            Header("Location:view.php?board_id={$_SESSION['board_id']}");
            exit;
        } else {
            echo "저장 실패 - 관리자에게 문의";
            echo "<a href='list.php'>게시글 목록으로 이동</a>";
            exit;
        }
?>
</html>
