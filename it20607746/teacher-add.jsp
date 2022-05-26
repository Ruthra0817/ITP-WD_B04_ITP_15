<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
									class="u-sidebar-nav-menu__link" href="teachers-all.jsp"> <span
										class="u-sidebar-nav-menu__item-title">Teachers-list</span>
								</a></li>
								<li class="u-sidebar-nav-menu__item"><a
									class="u-sidebar-nav-menu__link" href="teacher-add.jsp"> <span
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



				<section class="es-form-area">
					<div class="card">
						<header
							class="card-header bg-gradient border-0 pt-5 pb-5 d-flex align-items-center">
							<h2 class="text-white mb-0">Add New Teacher</h2>
						</header>
						<div class="card-body">
							<form action="NewTeacher" class="es-form es-add-form"
								method="POST">
								<div class="row">
									<div class="col-lg-8 offset-lg-2 col-md-12 mb-4">
										<label for="title">Teacher Name</label> <input type="text"
											placeholder="Alexa" name="name" required>
									</div>
									<div class="col-lg-8 offset-lg-2 col-md-12 mb-4">
										<label for="title">Date of birth</label> <input type="date"
											name="DOB" required>
									</div>
									<div class="col-lg-8 offset-lg-2 col-md-12 mb-4">
										<label for="title">Address</label> <input type="text"
											name="address" required>
									</div>
									<div class="col-lg-8 offset-lg-2 col-md-12 mb-4">
										<label for="title">Phone</label> <input type="number"
											placeholder="+99123456780" name="phone" required>
									</div>
									<div class="col-lg-8 offset-lg-2 col-md-12 mb-4">
										<label for="formGroupExampleInput2">Password</label> <input
											type="password" class="form-control"
											id="formGroupExampleInput2" placeholder="Password"
											name="password">
									</div>
									<div class="col-lg-4 offset-lg-4 col-md-12 text-center">
										<button type="submit"
											class="btn btn-danger btn-block bg-gradient border-0 text-white">Add</button>
									</div>
								</div>

							</form>
						</div>
					</div>
				</section>

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
</body>
</html>
