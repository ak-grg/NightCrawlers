<?php 
require '../../config/config.php';
/* 
AKSHIT
19BCE0795
31-10-2021
*/
	
	if(isset($_GET['post_id']))
		$post_id = $_GET['post_id'];

	if(isset($_POST['result'])) {
		if($_POST['result'] == 'true')
			$query = mysqli_query($con, "UPDATE posts SET deleted='yes' WHERE id='$post_id'");
			$query = mysqli_query($con, "SELECT added_by,likes from posts WHERE id='$post_id'");
			$row = mysqli_fetch_array($query);
			$username = $row['added_by'];
			$likes = $row['likes'];
			$query = mysqli_query($con, "UPDATE users SET num_likes=num_likes - $likes WHERE user_name='$username'");
			$query = mysqli_query($con, "UPDATE users SET num_posts=num_posts - 1 WHERE user_name='$username'");
	}

?>