<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>JSP Standard page</title>
	<!-- Meta data -->

	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">

	</style>
</head>
<body>

	<div class="container-fluid">

	<form action="addArticle" method="POST" role="form">
		<legend>Add article</legend>
	
		<div class="form-group">
			<label for="">Type ID</label>
			<input type="text" class="form-control" id="" placeholder="Demo content">
		</div>
	
		<div class="form-group">
			<label for="">Title</label>
			<input type="text" class="form-control" id="" placeholder="Demo content">
		</div>
	
		<div class="form-group">
			<label for="">Summary</label>
			<input type="text" class="form-control" id="" placeholder="Demo content">
		</div>
	
		<div class="form-group">
			<label for="">Content</label>
			<input type="text" class="form-control" id="" placeholder="Demo content">
		</div>
	
		<div class="form-group">
			<label for="">Creator ID</label>
			<input type="text" class="form-control" id="" placeholder="Demo content">
		</div>
	
		<div class="form-group">
			<label for="">Image</label>
			<input type="text" class="form-control" id="" placeholder="Demo content">
		</div>
	
		<div class="form-group">
			<label for="">Publication time</label>
			<input type="datetime" class="form-control" id="" placeholder="Demo content">
		</div>
	
		
	
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
		
	</div>


	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>

	<script type="text/javascript">
		$(document).ready(
			function() {

			});

	</script>
</body>
</html>
