<?php

	$sql = "SELECT * from comment where work_id='{$_SESSION['board_id']}'";
	$result = $dbConnect->query($sql);
  if($result) {
      $dataCount = $result->num_rows;
      $j=0;
      if($dataCount > 0){
          for($i = 0; $i < $dataCount; $i++){
              $memberInfo = $result->fetch_array(MYSQLI_ASSOC);
              $memberInfo1[$j] =  $memberInfo['content'];
							$memberInfo3[$j] =  $memberInfo['id'];
             $j++;//j는 로그인한 사람의 친구수
              }
            }
          }

?>

<?php
$sql = "SELECT c.work_id,u.username,c.author_id from user u ,comment c where c.work_id='{$_SESSION['board_id']}' and u.member_id = c.author_id";
$result1 = $dbConnect->query($sql);


 ?>

<?php
  for($i = 0; $i < $dataCount; $i++){
		$memberInfo2 = $result1->fetch_array(MYSQLI_ASSOC);
    echo"작성자:";
    echo  $memberInfo2['username'];

 ?>

<br><textarea>
<?=  "{$memberInfo1[$i]}";?></textarea>
<button type="button"><a href="comment_updateForm.php?id=<?php echo  $memberInfo3[$i];?>">수정</a></button>
<button type="button"><a href="comment_delete.php?id=<?php echo  $memberInfo3[$i];?>">삭제</a></button>

<br>
<?php
}
?>
