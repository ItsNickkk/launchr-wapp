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
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae nisl luctus, vestibulum ipsum sed, egestas dolor. Donec quis pulvinar felis, et vestibulum ex. Phasellus vehicula eros ut tortor maximus, non faucibus tortor blandit. Fusce fringilla ex sit amet augue pharetra, ac pharetra justo volutpat. Vivamus a massa fringilla, mattis diam id, sollicitudin dolor. Morbi at pretium nisi. Sed leo est, rhoncus at molestie ut, accumsan ac velit. <br />
			</div>
		</div>
	</div>
</asp:Content>
