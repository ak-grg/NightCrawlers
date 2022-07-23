<!--7/Oct/2021-->
<!--Akshit-->
<!--19BCE0795-->
<?php 
include("includes/header.php");


if(isset($_POST['post'])){
	$post = new Post($con,$userLoggedIn);
	$post->submitPost($_POST['post_text'], 'none');
	header("Location: index.php");
}

?>

		<div class="user_details column">
			<a href="<?php echo $userLoggedIn; ?>">
				<img src="<?php echo $user['profile_pic']; ?>">
			</a>

			<div class="user_details_left_right">
				<a href="<?php echo $userLoggedIn; ?>">
					<?php 
						echo $user['first_name'] . " " . $user['last_name'] . "<br>";
					?>
				</a>
				<?php
					echo "Posts " . $user['num_posts'] . "<br>";
					echo "Likes " . $user['num_likes'] . "<br>"; 
				?>
			</div>
		</div>

		<div class="main_column column">
			<form class="post_form" action="index.php" method="POST">
				<textarea name = "post_text" id= "post_text" placeholder="Somthing in mind?"></textarea>
				<input type="submit" name="post" id="post_button" value="Post">
				<hr>

			</form>

			
			
			<div class="posts_area"></div>
			<img id="loading" src="assets/images/icons/loading.gif" width="30" height="30">

		<script >
			var userLoggedIn = '<?php echo $userLoggedIn; ?>';
			/* 
				Akshit
				19BCE0795
				30-10-2021
			*/

			$(document).ready(function(){
				$('#loading').show();
				//original ajax request for loading first posts
				$.ajax({
					url: "includes/handlers/ajax_load_posts.php",
					type: "POST",
					data: "page=1&userLoggedIn=" + userLoggedIn,
					cache: false,

					success: function(data){
						$('#loading').hide();
						$('.posts_area').html(data);
					}
				});

				$(window).scroll(function() {
                    var height = $('.posts_area').height(); //Div containing posts
                    var scroll_top = $(this).scrollTop();
                    var page = $('.posts_area').find('.nextPage').val();
                    var noMorePosts = $('.posts_area').find('.noMorePosts').val();

                    if (((window.innerHeight + window.scrollY) >= document.body.scrollHeight) && noMorePosts == 'false') {
                        $('#loading').show();

                        var ajaxReq = $.ajax({
                            url: "includes/handlers/ajax_load_posts.php",
                            type: "POST",
                            data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
                            cache:false,

                            success: function(response) {
                                $('.posts_area').find('.nextPage').remove(); //Removes current .nextpage 
                                $('.posts_area').find('.noMorePosts').remove(); //Removes current .nextpage 

                                $('#loading').hide();
                                $('.posts_area').append(response);
                            }
                        });

                    } //End if 

                    return false;

                }); //End (window).scroll(function())*/

				
			});//END $(document).ready(function()
		</script>

	</div>
	
</body>
</html>