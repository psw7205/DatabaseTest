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
    unset($_SESSION['member_id']);
    unset($_SESSION['Type_id']);
    unset($_SESSION['username']);
    echo "로그아웃 되었습니다.";
    echo "<br>";
    Header("Location:main.php");
?>

</html>
