<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="Launchr.pages.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script src="https://cdn.jsdelivr.net/npm/@webcomponents/webcomponentsjs@2/webcomponents-loader.min.js"></script>
	<script type="module" src="https://cdn.jsdelivr.net/gh/zerodevx/zero-md@1/src/zero-md.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="row">
	<div class="col-xl-1 hidden-xs">&nbsp;</div>
	<div class="col-xl-10 pt-5 pb-5">
		<div class="row">
			<div class="col-xl-6 text-center">
				<div>
					<img class="project-photo" src="../Content/images/content1.jpg" />
				</div>
			</div>
			<div class="col-xl-6">
				<div class="row">
					<div class="col">
						<h2 class="project-info">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut nibh dui.</h2>
					</div>				
				</div>
				<div class="row">
					<div class="col">
						<p class="project-info">lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,</p>
					</div>
				</div>
				<div class="progress mb-3">
					<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<h3 class="project-info">$0 plegded of $100000</h3>
					</div>
					<div class="col-xl-6 text-right">
						<h3>110 backers</h3>
						<h4>3 days left</h4>
					</div>
				</div>
				<div class="row">
					<asp:Button ID="btnBackProj" runat="server" Text="Back this Project" />
				</div>
			</div>
		</div>
	</div>
</div>


<%--	<zero-md>
		<template>
			<xmp>
			</xmp>
		</template>
	</zero-md>--%>
</asp:Content>
