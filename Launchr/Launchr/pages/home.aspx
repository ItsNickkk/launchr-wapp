<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Launchr.pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div id="hero-container" class="container-fluid">
		<div class="row">
			<div class="col-lg-9">&nbsp;</div>
			<div class="col-lg-3 p-5">
				<div id="hero-container__search" class="p-3" >
					<div id="hero-container__search--div">
							<h2>Be a part of what you love</h2>
							<p>Launch:r is a platform that connects early adopters with thinkers and tinkerers to bring a project to life. Start searching from 42069 projects.</p>
						<div class="form-group">
							<label for="searchProjects"></label>
							<input type="text" class="form-control" id="searchProjects" aria-describedby="emailHelp" placeholder="Search for projects..."><br />
							<button type="button" class="btn btn-secondary">Search</button>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<div class="container" id="homepage__content1">
		<div class="row">
			<div class="col-lg-12">
				<h3>Trending projects</h3>
				<div class="row">
					<a href="#" class="col-lg-6 p-2">
						<div class="trending-projects-card">
							<div class="row">
								<div class="col-lg-6">
									<img src="../Content/images/content1.jpg" />
								</div>								
								<div class="col-lg-6 p-4">
									<h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
									<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
								</div>
							</div>
						</div>
					</a>
					<a href="#" class="col-lg-6 p-2">
						<div class="trending-projects-card">
							<div class="row">
								<div class="col-lg-6">
									<img src="../Content/images/content2.jpg" />
								</div>								
								<div class="col-lg-6 p-4">
									<h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
									<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
