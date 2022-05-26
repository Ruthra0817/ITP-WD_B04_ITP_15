<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="eschool.teacher.service.Service"%>
<%@ page import="eschool.teacher.model.Teacher"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%
HttpSession sess = request.getSession(false);
if (sess.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- Head -->

<head>
<title>eSchool | Dashboard Template</title>

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="keywords"
	content="Bootstrap Theme, Freebies, Dashboard, MIT license">
<meta name="description" content="Stream - Dashboard UI Kit">
<meta name="author" content="htmlstream.com">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.png" type="image/x-icon">
<!-- Web Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap"
	rel="stylesheet">
<!-- Components Vendor Styles -->
<link rel="stylesheet" href="assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet"
	href="assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/jquery-ui.min.css">
<!-- Theme Styles -->
<link rel="stylesheet" href="assets/css/theme.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- Custom Charts -->
<style>
.js-doughnut-chart {
	width: 70px !important;
	height: 70px !important;
}
</style>
</head>
<!-- End Head -->

<body>
	<!--Modal-->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="POST" action="UpdateTeacher">
					<div class="modal-body">
						<div class="container">
							<div class="row">
								<div class="col-sm">
									<div class="form-group">
										<label for="formGroupExampleInput">Name</label> <input
											type="text" class="form-control" id="formGroupExampleInput"
											placeholder="Name" name="name">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Date of birth</label> <input
											type="text" class="form-control" id="formGroupExampleInput2"
											placeholder="Email" name="DOB">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Address</label> <input
											type="text" class="form-control" id="formGroupExampleInput2"
											placeholder="Password" name="address">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Phone number</label> <input
											type="number" class="form-control" id="formGroupExampleInput2"
											placeholder="Phone number" name="phonenumber">
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput2">Password</label> <input
											type="password" class="form-control" id="formGroupExampleInput2"
											placeholder="Phone number" name="password">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" value="" name="teacherID">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save
							changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--Modal-->
	<!-- Header (Topbar) -->
	<header class="u-header">
		<div class="u-header-left">
			<a class="u-header-logo" href="index.jsp"> <img
				class="u-logo-desktop" src="assets/img/logo.png" width="160"
				alt="Stream Dashboard"> <img class="img-fluid u-logo-mobile"
				src="assets/img/logo-mobile.png" width="50" alt="Stream Dashboard">
			</a>
		</div>

		<div class="u-header-middle">
			<a class="js-sidebar-invoker u-sidebar-invoker text-danger" href="#!"
				data-is-close-all-except-this="true" data-target="#sidebar"> <i
				class="fa fa-bars u-sidebar-invoker__icon--open"></i> <i
				class="fa fa-times u-sidebar-invoker__icon--close"></i>
			</a>

			
		</div>

		
	</header>
	<!-- End Header (Topbar) -->

	<main class="u-main" role="main">
		<!-- Sidebar -->
		<aside id="sidebar" class="u-sidebar">
			<div class="u-sidebar-inner bg-gradient bdrs-30">
				<header class="u-sidebar-header">
					<a class="u-sidebar-logo" href="index.jsp"> <img
						class="img-fluid" src="assets/img/logo.png" width="124"
						alt="Stream Dashboard">
					</a>
				</header>

				<nav class="u-sidebar-nav">
					<ul class="u-sidebar-nav-menu u-sidebar-nav-menu--top-level">
						<!-- Dashboard -->
						<li class="u-sidebar-nav-menu__item"><a
							class="u-sidebar-nav-menu__link active" href="index.jsp"> <i
								class="fas fa-tachometer-alt u-sidebar-nav-menu__item-icon"></i>
								<span class="u-sidebar-nav-menu__item-title">Dashboard</span>
						</a></li>
						<!-- End Dashboard -->

						<!-- Attendances -->
						<li class="u-sidebar-nav-menu__item"><a
							class="u-sidebar-nav-menu__link" href="#!"
							data-target="#attendances"> <i
								class="fas fa-user-check u-sidebar-nav-menu__item-icon"></i> <span
								class="u-sidebar-nav-menu__item-title">Attendances</span> <i
								class="fa fa-angle-right u-sidebar-nav-menu__item-arrow"></i> <span
								class="u-sidebar-nav-menu__indicator"></span>
						</a>

							<ul id="attendances"
								class="u-sidebar-nav-menu u-sidebar-nav-menu--second-level"
								style="display: none;">

								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="attendances-list.jsp">
										<span class="u-sidebar-nav-menu__item-title">Attendances
											List</span>
								</a></li>

								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="attendances-report.jsp">
										<span class="u-sidebar-nav-menu__item-title">Attendances
											Report</span>
								</a></li>
							</ul></li>
						<!-- End Attendances -->

						<!-- Routines -->
						<li class="u-sidebar-nav-menu__item"><a
							class="u-sidebar-nav-menu__link" href="#!"
							data-target="#subMenu1"> <i
								class="fas fa-stopwatch u-sidebar-nav-menu__item-icon"></i> <span
								class="u-sidebar-nav-menu__item-title">Teachers</span> <i
								class="fa fa-angle-right u-sidebar-nav-menu__item-arrow"></i> <span
								class="u-sidebar-nav-menu__indicator"></span>
						</a>

							<ul id="subMenu1"
								class="u-sidebar-nav-menu u-sidebar-nav-menu--second-level"
								style="display: none;">
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="teachers-all.jsp">
										<span class="u-sidebar-nav-menu__item-title">Teachers-list</span>
								</a></li>
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link"
									href="teacher-add.jsp"> <span
										class="u-sidebar-nav-menu__item-title">Add Teachers-list</span>
								</a></li>
							</ul></li>
						<!-- End Routines -->

						<!-- Online-Exam -->
						<li class="u-sidebar-nav-menu__item"><a
							class="u-sidebar-nav-menu__link" href="#!"
							data-target="#online-exam"> <i
								class="fas fa-diagnoses u-sidebar-nav-menu__item-icon"></i> <span
								class="u-sidebar-nav-menu__item-title">Online Exam</span> <i
								class="fa fa-angle-right u-sidebar-nav-menu__item-arrow"></i> <span
								class="u-sidebar-nav-menu__indicator"></span>
						</a>

							<ul id="online-exam"
								class="u-sidebar-nav-menu u-sidebar-nav-menu--second-level"
								style="display: none;">

								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="online-exams.jsp"> <span
										class="u-sidebar-nav-menu__item-title">Online Exams</span>
								</a></li>
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="online-exam-add.jsp">
										<span class="u-sidebar-nav-menu__item-title">Add Online
											Exam</span>
								</a></li>
							</ul></li>
						<!-- End Online-Exams -->

						<!-- Marks -->
						<li class="u-sidebar-nav-menu__item"><a
							class="u-sidebar-nav-menu__link" href="#!" data-target="#marks">
								<i class="far fa-clipboard u-sidebar-nav-menu__item-icon"></i> <span
								class="u-sidebar-nav-menu__item-title">Marks</span> <i
								class="fa fa-angle-right u-sidebar-nav-menu__item-arrow"></i> <span
								class="u-sidebar-nav-menu__indicator"></span>
						</a>

							<ul id="marks"
								class="u-sidebar-nav-menu u-sidebar-nav-menu--second-level"
								style="display: none;">
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="marks.jsp"> <span
										class="u-sidebar-nav-menu__item-title">Marks</span>
								</a></li>
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="marks-add.jsp"> <span
										class="u-sidebar-nav-menu__item-title">Add Marks</span>
								</a></li>
							</ul></li>
						<!-- End Marks -->

						<!-- Students -->
						<li class="u-sidebar-nav-menu__item"><a
							class="u-sidebar-nav-menu__link" href="#!"
							data-target="#students"> <i
								class="fas fa-user-graduate u-sidebar-nav-menu__item-icon"></i>
								<span class="u-sidebar-nav-menu__item-title">Students</span> <i
								class="fa fa-angle-right u-sidebar-nav-menu__item-arrow"></i> <span
								class="u-sidebar-nav-menu__indicator"></span>
						</a>
							<ul id="students"
								class="u-sidebar-nav-menu u-sidebar-nav-menu--second-level"
								style="display: none;">
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="students-all.jsp"> <span
										class="u-sidebar-nav-menu__item-title">All Student</span>
								</a></li>
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="students-add.jsp"> <span
										class="u-sidebar-nav-menu__item-title">Add Student</span>
								</a></li>
							</ul></li>
						<!-- End Students -->
					</ul>
				</nav>
			</div>
		</aside>
		<!-- End Sidebar -->

		<div class="u-content">
			<div class="u-body">

				<!-- breadcumb-area -->
				<section class="breadcumb-area card bg-gradient mb-5">
					<div class="bread-cumb-content card-body d-flex align-items-center">
						<div class="breadcumb-heading">
							<h2 class="text-white">All Teachers</h2>
						</div>
						<div class="breadcumb-image ml-auto">
							<img src="assets/img/breadcumb-students.png" alt="">
						</div>
					</div>
				</section>
				<!-- End breadcumb-area -->




				<section class="es-form-area">
					<div class="card">
						<header
							class="card-header bg-gradient border-0 pt-5 pb-5 d-flex align-items-center">
							<a href="students-add.jsp"
								class="btn btn-sm btn-pill btn-outline-light ml-auto">+ Add
								New</a>
						</header>
						<div class="card-body">
							<div class="attendances-list-wrap mt-5">
								<div class="show-option d-flex align-items-center mb-4">
									<div class="show-list-count">
										<p>
											show <select id="section" class="">
												<option data-display="10">10</option>
												<option value="1">20</option>
												<option value="2">30</option>
											</select> items
										</p>
									</div>
									<div class="search-student ml-auto">
										<form action="SearchTeacherByName" class="search-student-form"
											method="POST">
											<input type="text" placeholder="Teacher Name" name="search"
												required>
											<button type="submit" class="btn btn-lg btn-pill bg-gradient text-white">Search</button>
										</form>
									</div>
								</div>
									
								<div class="table-responsive">
									<table class="table mb-0">
										<thead class="bg-gradient">
											<tr>
												<th scope="col" class="text-white">ID</th>
												<th scope="col" class="text-white">Name</th>
												<th scope="col" class="text-white text-center">DOB</th>
												<th scope="col" class="text-white text-center">Address</th>
												<th scope="col" class="text-white text-center">Phone</th>
												<th scope="col" colspan="2" class="text-white text-center">Option</th>
											</tr>
										</thead>

										<tbody>
											<%
											if (request.getAttribute("searchTeacherByName") != null) {
												ArrayList<Teacher> result = (ArrayList<Teacher>) request.getAttribute("searchTeacherByName");
												int count = 1;
												for (Teacher t : result) {
											%>
											<tr>
												<td><%=t.getTeacherID()%></td>
												<td><%=t.getName()%></td>
												<td><%=t.getDOB()%></td>
												<td><%=t.getAddress()%></td>
												<td><%=t.getPhoneNumber()%></td>
												<td><form method="POST" action="DeleteTeacher">
														<button type="submit" class="btn btn-primary">Delete</button>
														<input type="hidden" value=<%=t.getTeacherID()%>
															name="teacherID">
													</form></td>
												<td><a href="#exampleModalCenter" data-toggle="modal"
													data-target="#exampleModalCenter"
													data-teacher-id=<%=t.getTeacherID()%>
													data-teacher-phonenumber=<%=t.getPhoneNumber()%>
													data-teacher-dob=<%=t.getDOB()%>
													data-teacher-address=<%=t.getAddress()%>
													data-teacher-name=<%=t.getName()%>
													data-teacher-password=<%=t.getPassword()%>
													class="text-dark">Edit</a></td>
											</tr>
											<%
											count++;
											}
											} else {
											ArrayList<Teacher> result = Service.getStudents();
											int count = 1;
											for (Teacher t : result) {
											%>
											<tr>
												<td><%=t.getTeacherID()%></td>
												<td><%=t.getName()%></td>
												<td><%=t.getDOB()%></td>
												<td><%=t.getAddress()%></td>
												<td><%=t.getPhoneNumber()%></td>
												<td><form method="POST" action="DeleteTeacher">
														<button type="submit" class="btn btn-primary">Delete</button>
														<input type="hidden" value=<%=t.getTeacherID()%>
															name="teacherID">
													</form></td>
												<td><a href="#exampleModalCenter" data-toggle="modal"
													data-target="#exampleModalCenter"
													data-teacher-id=<%=t.getTeacherID()%>
													data-teacher-phonenumber=<%=t.getPhoneNumber()%>
													data-teacher-dob=<%=t.getDOB()%>
													data-teacher-address=<%=t.getAddress()%>
													data-teacher-name=<%=t.getName()%>
													data-teacher-password=<%=t.getPassword()%>
													class="text-dark">Edit</a></td>
											</tr>
											<%
											count++;
											}
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</section>

				<div class="row">
					<div class="col-md-12 text-center">
						<nav aria-label="Bootstrap Pagination"
							class="mt-5 text-center d-inline-block">
							<div class="col">
										<button type="submit"
											class="es-form-btn btn btn-block bg-gradient text-white">Attendance Report</button>
									</div>
									<br>
							<ul class="pagination mb-0">
								<li class="page-item"><a
									class="btn btn-outline-danger prev" href="#"><span
										class="ml-1 d-none d-xl-inline-block">Previous</span></a></li>
								<li class="page-item"><a
									class="btn btn-danger bg-gradient text-white ml-4 mr-4"
									href="#">1</a></li>
								<li class="page-item"><a
									class="btn btn-outline-danger next" href="#"><span
										class="mr-1 d-none d-xl-inline-block">Next</span></a></li>
							</ul>
						</nav>
					</div>
				</div>



			</div>
		</div>
	</main>

	<!-- Global Vendor -->
	<script src="assets/vendor/jquery/dist/jquery.min.js"></script>
	<script src="assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
	<script src="assets/vendor/popper.js/dist/umd/popper.min.js"></script>
	<script src="assets/vendor/bootstrap/bootstrap.min.js"></script>

	<!-- Plugins -->
	<script
		src="assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="assets/vendor/chart.js/dist/Chart.min.js"></script>
	<script src="assets/js/jquery.nice-select.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>

	<!-- Initialization  -->
	<script src="assets/js/sidebar-nav.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/dashboard-page-scripts.js"></script>
	<!--<script src="assets/js/scripts.js"></script>-->
	<script type="text/javascript">
		$('#exampleModalCenter')
				.on(
						'show.bs.modal',
						function(e) {

							//get data-id attribute of the clicked element
							var teacherID = $(e.relatedTarget).data('teacher-id');
							var phonenumber = $(e.relatedTarget).data(
									'teacher-phonenumber');
							var dob = $(e.relatedTarget).data('teacher-dob');
							var name = $(e.relatedTarget).data('teacher-name');
							var password = $(e.relatedTarget).data('teacher-password');

							var address = $(e.relatedTarget).data('teacher-address');

							//populate the textbox
							$(e.currentTarget).find('input[name="teacherID"]').val(teacherID);
							$(e.currentTarget).find('input[name="phonenumber"]').val(phonenumber);
							$(e.currentTarget).find('input[name="DOB"]').val(dob);
							$(e.currentTarget).find('input[name="name"]').val(name);
							$(e.currentTarget).find('input[name="address"]').val(address);
							$(e.currentTarget).find('input[name="password"]').val(password);
						});
	</script>
</body>
</html>
