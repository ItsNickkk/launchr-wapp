<%@ Page Title="Contact Us | Launch:r" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="Launchr.pages.contact_us" %>
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
			<div class="hero-image-1 hi4">
				<div class="hero-text-1">
					<h1 class="text-white animate__animated animate__delay-1s animate__fadeInUp">Contact Us</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="row pt-5 mt-5">
		<div class="col-5 p-0 text-right pb-5">
			<h2>Have Concerns?</h2>
			<p>Feel free to contact us via button below</p>
			<a href="mailto:support@launchr.com" class="btn launchr-btn mt-5 mb-5">Contact Us</a>
		</div>
		<div class="col-5 offset-xl-1 pb-5">
			<h2>Locate us</h2>
			<iframe style="height:500px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.147846094923!2d101.6985576505912!3d3.0550773545641667!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc4abb795025d9%3A0x1c37182a714ba968!2sAsia+Pacific+University+of+Technology+%26+Innovation+(APU)!5e0!3m2!1sen!2smy!4v1541949786261" width="600" height="600" frameborder="0"  allowfullscreen></iframe>
		</div>
	</div>
</div>
</asp:Content>
