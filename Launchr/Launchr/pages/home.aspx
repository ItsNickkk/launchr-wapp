<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Launchr.pages.WebForm1" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div id="hero-container" class="container-fluid">
		<div class="row">
			<div class="col-xl-9">&nbsp;</div>
			<div class="col-xl-3 p-5">
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
	<div class="container-fluid" id="homepage__content1">
		<div class="row">
			<div class="col-xl-1 hidden-xs">&nbsp;</div>
			<div class="col-xl-10 p-1">
			<!--Content 1 Carousel Start-->
			<div id="project-carousel" class="carousel slide" data-ride="carousel">
				<div class="row">
					<div class="col-xl-10">
						<h2>Trending projects</h2><p>Discover projects that are loved by backers</p>
					</div>
					<div class="col-xl">
						<button class="btn btn-secondary" data-target="#project-carousel" data-slide-to="0">1</button>
						<button class="btn btn-secondary" data-target="#project-carousel" data-slide-to="1">2</button>
						<button class="btn btn-secondary" data-target="#project-carousel" data-slide-to="2">3</button>
					</div>
				</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
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
						</div>
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
					<div class="col-xl">
						<button class="btn btn-secondary" data-target="#new-carousel" data-slide-to="0">1</button>
						<button class="btn btn-secondary" data-target="#new-carousel" data-slide-to="1">2</button>
						<button class="btn btn-secondary" data-target="#new-carousel" data-slide-to="2">3</button>
					</div>
				</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
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
						</div>
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
			<div class="col-md-2 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/tech.svg"/><h5>Technology</h5></a></div>
			<div class="col-md-2 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/film.svg"/><h5>Film</h5></a></div>
			<div class="col-md-2 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/art.svg"/><h5>Art</h5></a></div>
			<div class="col-md-2 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/foodcraft.svg"/><h5>Food & Craft</h5></a></div>
			<div class="col-md-2 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/game.svg"/><h5>Game</h5></a></div>
		</div>
		<div class="row collapse" id="more-topic">
			<div class="col-2 offset-md-1 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/music.svg"/><h5>Music</h5></a></div>
			<div class="col-2 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/publishing.svg"/><h5>Publishing</h5></a></div>
			<div class="col-2 text-center"><a href="#" class="topic-icon"><img src="../Content/Logo/topic/design.svg"/><h5>Design</h5></a></div>
		</div>
		<div class="row">
			<div class="text-center col m-3"><button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#more-topic">More Topics</button></div>
		</div>
	</div>
	<!--Browse Topic End-->
	<!--Join Us Start-->
		<div class="container-fluid border pt-5 pb-5">
			<div class="row">
				<div class="text-center col-10 offset-md-1"><h1>Like what you see?</h1></div> 
			</div>
			<div class="row">
				<div class="text-center col-10 offset-md-1 pt-3">Join us in the adventure to bring ideas that solves real life problem - big or small from drawing board into real life!</div> 
			</div>
			<div class="row">
				<div class="text-center col-2 offset-md-5 mt-4"><button class="btn btn-secondary join-sign-up-btn">Sign Up</button></div>
			</div>
		</div>
	<!--Join Us End-->
</asp:Content>
