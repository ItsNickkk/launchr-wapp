<%@ Page Title="About Us | Launch:r" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="about-us.aspx.cs" Inherits="Launchr.pages.about_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link href="../Content/main.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid">
	<div class="row">
		<div class="col p-0">
			<div class="hero-image-1 hi1">
				<div class="hero-text-1">
					<img src="../Content/Logo/logo-white.png" class="animate__animated animate__delay-1s animate__fadeInDown"/>
					<h4 class=" animate__animated animate__delay-1s animate__fadeInUp">Launch your project</h4>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xl-6 offset-xl-1 mt-5 text-justify">
			<h2>About Launch:r</h2>
			<span style="font-size:1.5em;">
				Launch:r is a platform that helps creators to bring their project from drawing board to reality.
				We help connects early adopters with thinkers and tinkerers to bring a project to life.
			</span>
		</div>
	</div>
	<div class="row pt-5">
		<div class="col p-0 mt-5">
			<div class="hero-image-1 hi2">
				<div class="hero-text-1">
					<h3>Mission Statement</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xl-4 offset-xl-4 text-center pt-5 mt-5 pb-5 mb-5">
			<p class="mb-0" style="font-size:1.5em;">“To provide a platform to let prospects of a business to help the business owners or project owners to grow, or to turn something from their drawing board into a reality.” </p>
			<p>- Launch:r</p>
		</div>
	</div>
	<div class="row pt-5">
		<div class="col-xl-5 about-us-3 pl-0">
			<div class="hero-image-1 hi3">
				<div class="hero-text-1 text-right">
					<h3>Verdict from our users</h3>
				</div>
			</div>
		</div>
		<div class="col-xl-3 text-center pt-xl-5 mt-xl-5">
			<p class="mb-0" style="font-size:1.5em;">"Products on Launch:r are unique, more interesting. They aren’t like what I’d find on the market. They aren’t mainstream. It’s the newest tech that companies don’t even know will be popular." </p>
			<p>- John Doe</p>
		</div>
		<div class="col-xl-3 text-center pt-xl-5 mt-xl-5">
			<p class="mb-0" style="font-size:1.5em;">"Using Launch:r allowed us to connect our creations with a community that is eager for innovation. The team behind the platform also provided great feedback based on their experience with thousands of products launched every day." </p>
			<p>- Jane Doe</p>
		</div>
	</div>
	<div class="row pt-5">
		<div class='text-center col'>
			<h2>Like what you see?</h2>
		</div>
	</div>
	<div class="row">
		<div class='text-center col'>
			Start exploring from our projects!
		</div>
	</div>
	<div class='row pt-5 pb-5 mb-5'>
		<div class='text-center col'>
			<a href="search-result?query=" Class='btn btn-secondary launchr-btn'>Explore now</a>
		</div>
	</div>
</div>

</asp:Content>
