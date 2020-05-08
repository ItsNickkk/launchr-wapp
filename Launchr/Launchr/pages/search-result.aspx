<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="search-result.aspx.cs" Inherits="Launchr.pages.search_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
				<div class="row">
					<div class="col xl-12 neumorph p-3">
						<h1>Search result</h1>		
					</div>
				</div>
				<div class="row mt-3 min-vh-100">
					<div class="col" id="search-result-display">
						<div class="row d-none" id="no-result">
							<div class="col text-center">
								<h4>No result</h4>
							</div>
						</div>
						<!--Search Result 1-->
						<div class="row mb-3 search-card">
							<div class="col neumorph">
								<div class="row mb-3">
									<div class="col-xl-4">
										<img src="../Content/images/content4.jpg" />
									</div>
									<div class="col-xl-5 pt-3 pl-0">
										<a href="#"><h3>Project 1</h3></a>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscingLorem ipsum dolor sit amet, consectetur adipiscing</p>
									</div>
									<div class="col-xl-3 pt-3">
										<div class="row">
											<div class="col">
												<div class="progress">
													<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl mt-3">
												<span class="project-card-details">$75</span> raised of $100
											</div>
											<div class="col-xl text-right mt-3">
												<span class="project-card-details">75%</span>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<p class="mb-2">30 backers</p>
											</div>	
											<div class="col">
												<p class="mb-2 text-right">30 days left</p>
											</div>	
										</div>
									</div>
								</div>							
							</div>
						</div>
						<!--Search Result End-->
						<div class="row">
							<div class="col text-center">
								<button type="button" class="launchr-btn btn" id="see-more-result">See More</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function () {
		size_search_card = $("#search-result-display .search-card").length;
		console.log(size_search_card);
		x = 5;
		$('#search-result-display .search-card:lt(' + x + ')').show();
		$('#see-more-result').click(function () {
			x = (x + 5 <= size_search_card) ? x + 5 : size_search_card;
			$('#search-result-display .search-card:lt(' + x + ')').show();
			if (x == size_search_card) {
				$('#see-more-result').hide();
			}
		});
		if (size_search_card < 6) {
			$('#see-more-result').hide();
			if (size_search_card < 1) {
				$('#no-result').removeClass("d-none");
			}
		}
	});
</script>
</asp:Content>
