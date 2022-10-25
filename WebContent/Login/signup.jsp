<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	id.addEventListener('keyup', (event) =>{
		console.
	});
</script>
<style type="text/css">
	<style type="text/css">
	* {
	 	 margin: 0;
	 	 padding: 0;
	 	 box-sizing: border-box;
	 	 font-family: "Noto Sans KR", sans-serif;
	}

	a {
  		text-decoration: none;
  		color: black;
	}
	
	b {
		color: red;
	}

	.wrap {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.form {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}

	.login {
	  width: 30%;
	  height: 600px;
	  background: white;
	  border-radius: 20px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-direction: column;
	}
	

	h1 {
		color: #4B89DC;
		font-size: 6em;
	}

	.login_input {
	  margin-top: 20px;
	  width: 80%;
	}

	.login_input input {
	  width: 100%;
	  height: 50px;
	  border-radius: 30px;
	  margin-top: 10px;
	  padding: 0px 20px;
	  border: 1px solid lightgray;
	  outline: none;
	}


	.submit {
	  margin-top: 50px;
	  width: 80%;
	}
	.submit input {
	  width: 100%;
	  height: 50px;
	  border: 0;
	  outline: none;
	  border-radius: 40px;
	  background: linear-gradient(to left, rgb(137, 178, 233), rgb(131, 201, 231));
	  color: white;
	  font-size: 1.2em;
	  letter-spacing: 2px;
	}
	
	.submit_btn:hover {
	cursor: pointer;
	filter: brightness(0.85);
}
</style>
</head>
<body>
	<div class="wrap">
		<form class="form" method="post" action="<%=request.getContextPath()%>user_signup_ok.do">
			<div class="login">
			<h1>Coders</h1>
				<div class="login_input">
					<h4><b>*</b> E-mail<span id="id"></span></h4>
					<input type="email" id="id_input" name="id" placeholder="Email" required>
				</div>
		            
				<div class="login_input">
					<h4><b>*</b> Password<span id="pwd"></span></h4>
					<input type="password" id="pwd_input" name="pwd" placeholder="Password" required>
				</div>
				
				<div class="login_input">
					<h4><b>*</b> Password Check<span id="pwd_ck"></span></h4>
					<input type="password" id="pwd_ck_input" name="pwd" placeholder="Password Check" required>
				</div>
				
				<div class="login_input">
					<h4><b>*</b> Name</h4>
					<input type="text" name="pwd" placeholder="Name" required>
				</div>
		            
		            
				<div class="submit">
					<input class="submit_btn"type="submit" value="Login">
				</div>
			</div>
		</form>
	</div>
</body>
</html>