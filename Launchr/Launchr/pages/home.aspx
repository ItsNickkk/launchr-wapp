﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Launchr.pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<title>Launch:r | Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div id="hero-container" class="container-fluid">
		<div class="row">
			<div class="col-xl-4 offset-xl-8 p-5">
				<div id="hero-container__search" class="p-3" >
					<div id="hero-container__search--div">
							<h2>Be a part of what you love</h2>
							<p>Launch:r is a platform that connects early adopters with thinkers and tinkerers to bring a project to life. Start searching from  <asp:PlaceHolder ID="plcNumProjects" runat="server"></asp:PlaceHolder> projects.</p>
						<div class="form-group">
							<label for="searchProjects"></label>
							<input type="text" class="form-control" id="txtSearchHero" placeholder="Search for projects..." ><br />
							<a id="btnSearchHero" class="btn btn-secondary" href="search-result?query= ">Search</a>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<div class="container-fluid" id="homepage__content1">
		<div class="row">
			<div class="col-xl-1 hidden-xs">&nbsp;</div>
			<div class="col-xl-10 p-1">
			<!--Content 1 Carousel Start-->
			<div id="project-carousel" class="carousel slide" data-ride="carousel">
				<div class="row">
					<div class="col-lg">
						<h2>Trending projects</h2><p>Discover projects that are loved by backers</p>
					</div>
					<div class="col-lg text-right">
                        <asp:PlaceHolder ID="plcTrendingCarousel" runat="server"></asp:PlaceHolder>
						<%--<button class="btn btn-secondary" data-target="#project-carousel" data-slide-to="0">1</button>
						<button class="btn btn-secondary" data-target="#project-carousel" data-slide-to="1">2</button>
						<button class="btn btn-secondary" data-target="#project-carousel" data-slide-to="2">3</button>--%>
					</div>
				</div>
					<div class="carousel-inner">
                        <asp:PlaceHolder ID="plcTrendingCarouselInner" runat="server"></asp:PlaceHolder>
						<%--<div class="carousel-item active">
							<div class="row project-card-tray">
								<a href="#" class="col-xl-6 text-decoration-none card">
									<div class="projects-card">
										<div class="row">
											<div class="col-xl-6">
												<img src="../Content/images/content2.jpg" />
											</div>								
											<div class="col-xl-6 p-4">
											<div class="row">
													<div class="col">
														<h6>Food & Craft</h6>
													</div>
												</div>
												<div class="row h-30">
													<div class="col">
														<h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
													</div>
												</div>
												<div class="row h-30">
													<div class="col">
														<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<div class="progress mr-2">
															<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-xl">
														<span class="project-card-details">$75</span> raised of $100
													</div>	
													<div class="text-right col-xl mr-2">
														<span class="project-card-details">75%</span>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<p class="mb-2">30 backers</p>
													</div>		
												</div>
											</div>
										</div>
									</div>
								</a>
								<a href="#" class="col-xl-6  text-decoration-none card">
									<div class="projects-card">
										<div class="row h-100">
											<div class="col-xl-6 p-0">
												<img src="../Content/images/content4.jpg" />
											</div>								
											<div class="col-xl-6 p-4 h-100">
											<div class="row">
													<div class="col">
														<h6>Food & Craft</h6>
													</div>
												</div>
												<div class="row h-30">
													<div class="col">
														<h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
													</div>
												</div>
												<div class="row h-30">
													<div class="col">
														<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<div class="progress mr-2">
															<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-xl">
														<span class="project-card-details">$75</span> raised of $100
													</div>	
													<div class="text-right col-xl mr-2">
														<span class="project-card-details">75%</span>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<p class="mb-2">30 backers</p>
													</div>		
												</div>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<a href="#" class="col-xl-6 p-3">
									<div class="projects-card">
										<div class="row">
											<div class="col-xl-6">
												<img src="../Content/images/content2.jpg" />
											</div>								
											<div class="col-xl-6 p-4">
												<h4>Lodsadaadssddsdsadsaddasolor sit amet, consectetur adipiscing </h4>
												<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
											</div>
										</div>
									</div>
								</a>
								<a href="#" class="col-xl-6 p-3">
									<div class="projects-card">
										<div class="row">
											<div class="col-xl-6">
												<img src="../Content/images/content2.jpg" />
											</div>								
											<div class="col-xl-6 p-4">
												<h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
												<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<a href="#" class="col-xl-6 p-3">
									<div class="projects-card">
										<div class="row">
											<div class="col-xl-6">
												<img src="../Content/images/content1.jpg" />
											</div>								
											<div class="col-xl-6 p-4">
												<h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
												<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
											</div>
										</div>
									</div>
								</a>
								<a href="#" class="col-xl-6 p-3">
									<div class="projects-card">
										<div class="row">
											<div class="col-xl-6">
												<img src="../Content/images/content2.jpg" />
											</div>								
											<div class="col-xl-6 p-4">
												<h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
												<p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>--%>
					</div>
				</div>
				<!--Content 2 Carousel End-->
			</div>
		</div>
	</div>
	<!--Content 1 End-->
	<!--Content 2 Start-->
	<div class="container-fluid pt-2 border">
		<div class="row">
			<div class="col-xl-1 hidden-xs">&nbsp;</div>
			<div class="col-xl-10 p-1">
			<!--Content 2 Carousel Start-->
			<div id="new-carousel" class="carousel slide" data-ride="carousel">
				<div class="row">
					<div class="col-xl-10">
						<h2>Just in</h2><p>Discover projects that are just created</p>
					</div>
					<div class="col-xl text-right">
                        <asp:PlaceHolder ID="plcNewCarousel" runat="server"></asp:PlaceHolder>
						<%--<button class="btn btn-secondary" data-target="#new-carousel" data-slide-to="0">1</button>
						<button class="btn btn-secondary" data-target="#new-carousel" data-slide-to="1">2</button>
						<button class="btn btn-secondary" data-target="#new-carousel" data-slide-to="2">3</button>--%>
					</div>
				</div>
					<div class="carousel-inner">
                        <asp:PlaceHolder ID="plcNewCarouselInner" runat="server"></asp:PlaceHolder>
                        <%--<div class="carousel-item active">
                            <div class="row">
                                <a href="#" class="col-xl-6 p-3">
                                    <div class="projects-card">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <img src="../Content/images/content1.jpg" />
                                            </div>
                                            <div class="col-xl-6 p-4">
                                                <h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
                                                <p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="col-xl-6 p-3">
                                    <div class="projects-card">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <img src="../Content/images/content2.jpg" />
                                            </div>
                                            <div class="col-xl-6 p-4">
                                                <h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
                                                <p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <a href="#" class="col-xl-6 p-3">
                                    <div class="projects-card">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <img src="../Content/images/content1.jpg" />
                                            </div>
                                            <div class="col-xl-6 p-4">
                                                <h4>Lodsadaadssddsdsadsaddasolor sit amet, consectetur adipiscing </h4>
                                                <p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="col-xl-6 p-3">
                                    <div class="projects-card">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <img src="../Content/images/content2.jpg" />
                                            </div>
                                            <div class="col-xl-6 p-4">
                                                <h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
                                                <p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <a href="#" class="col-xl-6 p-3">
                                    <div class="projects-card">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <img src="../Content/images/content1.jpg" />
                                            </div>
                                            <div class="col-xl-6 p-4">
                                                <h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
                                                <p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="col-xl-6 p-3">
                                    <div class="projects-card">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <img src="../Content/images/content2.jpg" />
                                            </div>
                                            <div class="col-xl-6 p-4">
                                                <h4>Lorem ipsum dolor sit amet, consectetur adipiscing </h4>
                                                <p>lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,  </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>--%>
					</div>
				</div>
				<!--Content 2 Carousel End-->
			</div>
		</div>
	</div>
	<!--Content 2 end-->
	<!--Browse Topic Start-->
	<div class="container-fluid border pb-5">
		<div class="row">
			<div class="col-10 offset-md-1">
				<h2 class="pt-1">Browse by topic</h2><p>Refine your browsing experience</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1 hidden-xs">&nbsp;</div>
			<div class="col-md-2 text-center"><a href="search-result?topic=tech" class="topic-icon"><img src="../Content/Logo/topic/tech.svg"/><h5>Technology</h5></a></div>
			<div class="col-md-2 text-center"><a href="search-result?topic=film" class="topic-icon"><img src="../Content/Logo/topic/film.svg"/><h5>Film</h5></a></div>
			<div class="col-md-2 text-center"><a href="search-result?topic=art" class="topic-icon"><img src="../Content/Logo/topic/art.svg"/><h5>Art</h5></a></div>
			<div class="col-md-2 text-center"><a href="search-result?topic=foodcraft" class="topic-icon"><img src="../Content/Logo/topic/foodcraft.svg"/><h5>Food & Craft</h5></a></div>
			<div class="col-md-2 text-center"><a href="search-result?topic=games" class="topic-icon"><img src="../Content/Logo/topic/game.svg"/><h5>Game</h5></a></div>
		</div>
		<div class="row collapse" id="more-topic">
			<div class="col-md-2 offset-md-1 text-center"><a href="search-result?topic=music" class="topic-icon"><img src="../Content/Logo/topic/music.svg"/><h5>Music</h5></a></div>
			<div class="col-md-2 text-center"><a href="search-result?topic=publishing" class="topic-icon"><img src="../Content/Logo/topic/publishing.svg"/><h5>Publishing</h5></a></div>
			<div class="col-md-2 text-center"><a href="search-result?topic=design" class="topic-icon"><img src="../Content/Logo/topic/design.svg"/><h5>Design</h5></a></div>
			<div class="col-md-2 text-center"><a href="search-result?topic=others" class="topic-icon"><img src="../Content/Logo/topic/everythingelse.svg"/><h5>Everything Else</h5></a></div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="text-center col m-3"><button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#more-topic">More Topics</button></div>
		</div>
	</div>
	<!--Browse Topic End-->
	<!--Join Us Start-->
		<asp:PlaceHolder ID="signUpDiv" runat="server"></asp:PlaceHolder>
	<!--Join Us End-->
	<script src="../Scripts/pages/home.js"></script>
</asp:Content>
