<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>

<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<c:if test="${ empty sessionScope.loginUser }">
</c:if>

	<div class="loginArea" align="right">
		<c:if test="${ !empty sessionScope.loginUser }">
				<c:out value="${ loginUser.name }님 환영합니다!!"/>
				<c:url var="myInfo" value="myInfo.do"/>
				<c:url var="logout" value="logout.do"/>
				<button onclick="location.href='${myInfo}'">정보수정</button>
				<button onclick="location.href='${logout}'">로그아웃</button>
		</c:if>
	</div>


<c:url var="nlist" value="nlist.do" />		
	<c:url var="blist" value="blist.do" >
		<c:param name="page" value="1" />
	</c:url>


	<div class="menubar">
	
	</div>

<c:if test="${ empty sessionScope.loginUser }">
	<c:url var="loginpage" value="/loginpage.do"/>
	<a href='${ loginpage }' title="log in">로그인</a>
	<%-- <button onclick="location.href='${ loginpage }'" title="log in"><span class="edgtf-login-text">로그인</span></button> --%>
</c:if>


			<header class="edgtf-page-header">
				<div class="edgtf-menu-area edgtf-menu-right">
					<div class="edgtf-vertical-align-containers">
						<div class="edgtf-position-left">
							<div class="edgtf-position-left-inner">
								<div class="edgtf-logo-wrapper">
									<a itemprop="url" href="${pageContext.request.contextPath}/tcdetail.do"
										style="height: 41px;"> <img itemprop="image"
										class="edgtf-normal-logo"
										src="${pageContext.request.contextPath}/resources/images/home/logo.png"
										alt="logo" /> <img itemprop="image" class="edgtf-dark-logo"
										src="${pageContext.request.contextPath}/resources/images/home/logo.png"
										alt="dark logo" /> <img itemprop="image"
										class="edgtf-light-logo"
										src="${pageContext.request.contextPath}/resources/images/home/logo_white.png"
										alt="light logo" />
									</a>
								</div>
							</div>
						</div>
						<div class="edgtf-position-right">
							<div class="edgtf-position-right-inner">
								<nav class="edgtf-main-menu edgtf-drop-down edgtf-default-nav">
									<ul id="menu-main-menu-navigation" class="clearfix">
										<li id="nav-menu-item-36"
											class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-31 current_page_item edgtf-active-item narrow"><a
											href="https://urbango.qodeinteractive.com/" class=" current "><span
												class="item_outer"><span class="item_text">Home</span></span></a></li>
										<li id="nav-menu-item-1168"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
											href="#" class=""><span class="item_outer"><span
													class="item_text">Pages</span><i
													class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
											<div class="second">
												<div class="inner">
													<ul>
														<li id="nav-menu-item-1167"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="${pageContext.request.contextPath}/WEB-INF/views/common/menubar.jsp"
															class=""><span class="item_outer"><span
																	class="item_text">Get to know us</span></span></a></li>
														<li id="nav-menu-item-1165"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="https://urbango.qodeinteractive.com/how-it-works/"
															class=""><span class="item_outer"><span
																	class="item_text">How It Works</span></span></a></li>
														<li id="nav-menu-item-1166"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="https://urbango.qodeinteractive.com/contact-us/"
															class=""><span class="item_outer"><span
																	class="item_text">Contact Us</span></span></a></li>
														<li id="nav-menu-item-1787"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="https://urbango.qodeinteractive.com/our-top-authors/"
															class=""><span class="item_outer"><span
																	class="item_text">Our Top Authors<i
																		class="edgtf-menu-featured-icon fa fa-star"></i></span></span></a></li>
														<li id="nav-menu-item-1726"
															class="menu-item menu-item-type-custom menu-item-object-custom "><a
															href="https://urbango.qodeinteractive.com/404" class=""><span
																class="item_outer"><span class="item_text">404
																		Error Page</span></span></a></li>
													</ul>
												</div>
											</div></li>
										<li id="nav-menu-item-40"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
											href="#" class=" no_link" onclick="JavaScript: return false;"><span
												class="item_outer"><span class="item_text">Listings</span><i
													class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
											<div class="second">
												<div class="inner">
													<ul>
														<li id="nav-menu-item-1474"
															class="menu-item menu-item-type-custom menu-item-object-custom "><a
															href="https://urbango.qodeinteractive.com/listing-item/the-aeon-hall/"
															class=""><span class="item_outer"><span
																	class="item_text">Listing Item<i
																		class="edgtf-menu-featured-icon fa fa-star"></i></span></span></a></li>
														<li id="nav-menu-item-140"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">By
																		Location</span></span></a>
															<ul>
																<li id="nav-menu-item-138"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/chelsea/"
																	class=""><span class="item_outer"><span
																			class="item_text">Chelsea<i
																				class="edgtf-menu-featured-icon fa fa-star"></i></span></span></a></li>
																<li id="nav-menu-item-135"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/soho/"
																	class=""><span class="item_outer"><span
																			class="item_text">SoHo</span></span></a></li>
																<li id="nav-menu-item-136"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/tribeca/"
																	class=""><span class="item_outer"><span
																			class="item_text">TriBeCa</span></span></a></li>
																<li id="nav-menu-item-130"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/harlem/"
																	class=""><span class="item_outer"><span
																			class="item_text">Harlem</span></span></a></li>
																<li id="nav-menu-item-127"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/midtown/"
																	class=""><span class="item_outer"><span
																			class="item_text">Midtown</span></span></a></li>
																<li id="nav-menu-item-133"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/east-village/"
																	class=""><span class="item_outer"><span
																			class="item_text">East Village</span></span></a></li>
																<li id="nav-menu-item-132"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/little-italy/"
																	class=""><span class="item_outer"><span
																			class="item_text">Little Italy</span></span></a></li>
																<li id="nav-menu-item-129"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/greenwich-village/"
																	class=""><span class="item_outer"><span
																			class="item_text">Greenwich Village</span></span></a></li>
																<li id="nav-menu-item-128"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/financial-district/"
																	class=""><span class="item_outer"><span
																			class="item_text">Financial District</span></span></a></li>
																<li id="nav-menu-item-137"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/flatiron-district/"
																	class=""><span class="item_outer"><span
																			class="item_text">Flatiron District</span></span></a></li>
																<li id="nav-menu-item-139"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/upper-east-side/"
																	class=""><span class="item_outer"><span
																			class="item_text">Upper East Side</span></span></a></li>
																<li id="nav-menu-item-131"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																	href="https://urbango.qodeinteractive.com/listing-location/upper-west-side/"
																	class=""><span class="item_outer"><span
																			class="item_text">Upper West Side</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-122"
															class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
															href="https://urbango.qodeinteractive.com/listing-category/culture/"
															class=""><span class="item_outer"><span
																	class="item_text">Culture</span></span></a>
															<ul>
																<li id="nav-menu-item-149"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/art-gallery/"
																	class=""><span class="item_outer"><span
																			class="item_text">Art Gallery</span></span></a></li>
																<li id="nav-menu-item-150"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/exhibition/"
																	class=""><span class="item_outer"><span
																			class="item_text">Exhibition</span></span></a></li>
																<li id="nav-menu-item-151"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/lectures/"
																	class=""><span class="item_outer"><span
																			class="item_text">Lectures</span></span></a></li>
																<li id="nav-menu-item-152"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/performances/"
																	class=""><span class="item_outer"><span
																			class="item_text">Performances</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-117"
															class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
															href="https://urbango.qodeinteractive.com/listing-category/cuisine/"
															class=""><span class="item_outer"><span
																	class="item_text">Cuisine</span></span></a>
															<ul>
																<li id="nav-menu-item-118"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/asian/"
																	class=""><span class="item_outer"><span
																			class="item_text">Asian</span></span></a></li>
																<li id="nav-menu-item-119"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/cafe/"
																	class=""><span class="item_outer"><span
																			class="item_text">Café</span></span></a></li>
																<li id="nav-menu-item-120"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/italian/"
																	class=""><span class="item_outer"><span
																			class="item_text">Italian</span></span></a></li>
																<li id="nav-menu-item-121"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/catering/"
																	class=""><span class="item_outer"><span
																			class="item_text">Catering</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-123"
															class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
															href="https://urbango.qodeinteractive.com/listing-category/nightlife/"
															class=""><span class="item_outer"><span
																	class="item_text">Nightlife</span></span></a>
															<ul>
																<li id="nav-menu-item-153"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/bars/"
																	class=""><span class="item_outer"><span
																			class="item_text">Bars</span></span></a></li>
																<li id="nav-menu-item-154"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/clubs/"
																	class=""><span class="item_outer"><span
																			class="item_text">Clubs</span></span></a></li>
																<li id="nav-menu-item-155"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/live-music/"
																	class=""><span class="item_outer"><span
																			class="item_text">Live Music</span></span></a></li>
																<li id="nav-menu-item-156"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/private-parties/"
																	class=""><span class="item_outer"><span
																			class="item_text">Private Parties</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-116"
															class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
															href="https://urbango.qodeinteractive.com/listing-category/coworking/"
															class=""><span class="item_outer"><span
																	class="item_text">Coworking</span></span></a>
															<ul>
																<li id="nav-menu-item-145"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/all-inclusive/"
																	class=""><span class="item_outer"><span
																			class="item_text">All Inclusive</span></span></a></li>
																<li id="nav-menu-item-146"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/hot-desking/"
																	class=""><span class="item_outer"><span
																			class="item_text">Hot Desking</span></span></a></li>
																<li id="nav-menu-item-147"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/conference-space/"
																	class=""><span class="item_outer"><span
																			class="item_text">Conference Space</span></span></a></li>
																<li id="nav-menu-item-148"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/shared-space/"
																	class=""><span class="item_outer"><span
																			class="item_text">Shared Space</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-125"
															class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
															href="https://urbango.qodeinteractive.com/listing-category/tours/"
															class=""><span class="item_outer"><span
																	class="item_text">Tours</span></span></a>
															<ul>
																<li id="nav-menu-item-161"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/camping/"
																	class=""><span class="item_outer"><span
																			class="item_text">Camping</span></span></a></li>
																<li id="nav-menu-item-162"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/city-tours/"
																	class=""><span class="item_outer"><span
																			class="item_text">City Tours</span></span></a></li>
																<li id="nav-menu-item-163"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/trekking/"
																	class=""><span class="item_outer"><span
																			class="item_text">Trekking</span></span></a></li>
																<li id="nav-menu-item-164"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/sightseeing/"
																	class=""><span class="item_outer"><span
																			class="item_text">Sightseeing</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-124"
															class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
															href="https://urbango.qodeinteractive.com/listing-category/shopping/"
															class=""><span class="item_outer"><span
																	class="item_text">Shopping</span></span></a>
															<ul>
																<li id="nav-menu-item-157"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/arts-crafts/"
																	class=""><span class="item_outer"><span
																			class="item_text">Arts &#038; Crafts</span></span></a></li>
																<li id="nav-menu-item-158"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/malls/"
																	class=""><span class="item_outer"><span
																			class="item_text">Malls</span></span></a></li>
																<li id="nav-menu-item-159"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/markets/"
																	class=""><span class="item_outer"><span
																			class="item_text">Markets</span></span></a></li>
																<li id="nav-menu-item-160"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/vintage-stores/"
																	class=""><span class="item_outer"><span
																			class="item_text">Vintage Stores</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-115"
															class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
															href="https://urbango.qodeinteractive.com/listing-category/beauty/"
															class=""><span class="item_outer"><span
																	class="item_text">Beauty</span></span></a>
															<ul>
																<li id="nav-menu-item-141"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/cosmetics-shop/"
																	class=""><span class="item_outer"><span
																			class="item_text">Cosmetics Shop</span></span></a></li>
																<li id="nav-menu-item-142"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/hair-salons/"
																	class=""><span class="item_outer"><span
																			class="item_text">Hair Salons</span></span></a></li>
																<li id="nav-menu-item-143"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/manicure/"
																	class=""><span class="item_outer"><span
																			class="item_text">Manicure</span></span></a></li>
																<li id="nav-menu-item-144"
																	class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																	href="https://urbango.qodeinteractive.com/listing-category/wellness/"
																	class=""><span class="item_outer"><span
																			class="item_text">Wellness</span></span></a></li>
															</ul></li>
													</ul>
												</div>
											</div></li>
										<li id="nav-menu-item-42"
											class="menu-item menu-item-type-post_type menu-item-object-page  narrow"><a
											href="https://urbango.qodeinteractive.com/pricing-package/"
											class=""><span class="item_outer"><span
													class="item_text">Pricing</span></span></a></li>
										<li id="nav-menu-item-37"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
											href="#" class=" no_link" onclick="JavaScript: return false;"><span
												class="item_outer"><span class="item_text">Blog</span><i
													class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
											<div class="second">
												<div class="inner">
													<ul>
														<li id="nav-menu-item-413"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="https://urbango.qodeinteractive.com/blog/right-sidebar/"
															class=""><span class="item_outer"><span
																	class="item_text">Right Sidebar</span></span></a></li>
														<li id="nav-menu-item-412"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="https://urbango.qodeinteractive.com/blog/left-sidebar/"
															class=""><span class="item_outer"><span
																	class="item_text">Left Sidebar</span></span></a></li>
														<li id="nav-menu-item-411"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="https://urbango.qodeinteractive.com/blog/no-sidebar/"
															class=""><span class="item_outer"><span
																	class="item_text">No Sidebar</span></span></a></li>
														<li id="nav-menu-item-414"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">Post
																		Types</span></span></a>
															<ul>
																<li id="nav-menu-item-415"
																	class="menu-item menu-item-type-post_type menu-item-object-post "><a
																	href="https://urbango.qodeinteractive.com/delicious-coffee/"
																	class=""><span class="item_outer"><span
																			class="item_text">Standard</span></span></a></li>
																<li id="nav-menu-item-416"
																	class="menu-item menu-item-type-post_type menu-item-object-post "><a
																	href="https://urbango.qodeinteractive.com/theory-and-practice/"
																	class=""><span class="item_outer"><span
																			class="item_text">Gallery</span></span></a></li>
																<li id="nav-menu-item-418"
																	class="menu-item menu-item-type-post_type menu-item-object-post "><a
																	href="https://urbango.qodeinteractive.com/best-of-the-web/"
																	class=""><span class="item_outer"><span
																			class="item_text">Link</span></span></a></li>
																<li id="nav-menu-item-417"
																	class="menu-item menu-item-type-post_type menu-item-object-post "><a
																	href="https://urbango.qodeinteractive.com/world-traveler/"
																	class=""><span class="item_outer"><span
																			class="item_text">Quote</span></span></a></li>
																<li id="nav-menu-item-419"
																	class="menu-item menu-item-type-post_type menu-item-object-post "><a
																	href="https://urbango.qodeinteractive.com/truly-creative/"
																	class=""><span class="item_outer"><span
																			class="item_text">Audio</span></span></a></li>
																<li id="nav-menu-item-420"
																	class="menu-item menu-item-type-post_type menu-item-object-post "><a
																	href="https://urbango.qodeinteractive.com/providing-the-vision/"
																	class=""><span class="item_outer"><span
																			class="item_text">Video</span></span></a></li>
															</ul></li>
													</ul>
												</div>
											</div></li>
										<li id="nav-menu-item-38"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
											href="#" class=" no_link" onclick="JavaScript: return false;"><span
												class="item_outer"><span class="item_text">Shop</span><i
													class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
											<div class="second">
												<div class="inner">
													<ul>
														<li id="nav-menu-item-559"
															class="menu-item menu-item-type-post_type menu-item-object-page "><a
															href="https://urbango.qodeinteractive.com/product-list/"
															class=""><span class="item_outer"><span
																	class="item_text">Product List</span></span></a></li>
														<li id="nav-menu-item-563"
															class="menu-item menu-item-type-custom menu-item-object-custom "><a
															href="https://urbango.qodeinteractive.com/product/italian-salad/"
															class=""><span class="item_outer"><span
																	class="item_text">Product Single</span></span></a></li>
														<li id="nav-menu-item-564"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">Shop
																		Layouts</span></span></a>
															<ul>
																<li id="nav-menu-item-562"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/product-list/three-columns/"
																	class=""><span class="item_outer"><span
																			class="item_text">Three Columns</span></span></a></li>
																<li id="nav-menu-item-560"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/product-list/four-columns/"
																	class=""><span class="item_outer"><span
																			class="item_text">Four Columns</span></span></a></li>
																<li id="nav-menu-item-561"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/product-list/full-width/"
																	class=""><span class="item_outer"><span
																			class="item_text">Full Width</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-80"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">Shop
																		Pages</span></span></a>
															<ul>
																<li id="nav-menu-item-77"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/my-account/"
																	class=""><span class="item_outer"><span
																			class="item_text">My account</span></span></a></li>
																<li id="nav-menu-item-79"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/cart/"
																	class=""><span class="item_outer"><span
																			class="item_text">Cart</span></span></a></li>
																<li id="nav-menu-item-78"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/checkout/"
																	class=""><span class="item_outer"><span
																			class="item_text">Checkout</span></span></a></li>
															</ul></li>
													</ul>
												</div>
											</div></li>
										<li id="nav-menu-item-39"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub wide"><a
											href="#" class=" no_link" onclick="JavaScript: return false;"><span
												class="item_outer"><span class="item_text">Elements</span><i
													class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
											<div class="second">
												<div class="inner">
													<ul>
														<li id="nav-menu-item-1447"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">Features</span></span></a>
															<ul>
																<li id="nav-menu-item-1421"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/category-list/"
																	class=""><span class="item_outer"><span
																			class="item_text">Category List</span></span></a></li>
																<li id="nav-menu-item-1433"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/listing-list/"
																	class=""><span class="item_outer"><span
																			class="item_text">Listing List</span></span></a></li>
																<li id="nav-menu-item-1434"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/listing-packages/"
																	class=""><span class="item_outer"><span
																			class="item_text">Listing Packages</span></span></a></li>
																<li id="nav-menu-item-1437"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/location-list/"
																	class=""><span class="item_outer"><span
																			class="item_text">Location List</span></span></a></li>
																<li id="nav-menu-item-1436"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/location-banner/"
																	class=""><span class="item_outer"><span
																			class="item_text">Location Banner</span></span></a></li>
																<li id="nav-menu-item-1438"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/map-with-listings/"
																	class=""><span class="item_outer"><span
																			class="item_text">Map With Listings</span></span></a></li>
																<li id="nav-menu-item-1422"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/category-tabs/"
																	class=""><span class="item_outer"><span
																			class="item_text">Category Tabs</span></span></a></li>
																<li id="nav-menu-item-1435"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/listing-search/"
																	class=""><span class="item_outer"><span
																			class="item_text">Listing Search<i
																				class="edgtf-menu-featured-icon fa fa-star"></i></span></span></a></li>
																<li id="nav-menu-item-1417"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/author-list/"
																	class=""><span class="item_outer"><span
																			class="item_text">Author List</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-1448"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">Classic</span></span></a>
															<ul>
																<li id="nav-menu-item-1416"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/accordions/"
																	class=""><span class="item_outer"><span
																			class="item_text">Accordions</span></span></a></li>
																<li id="nav-menu-item-1445"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/tabs/"
																	class=""><span class="item_outer"><span
																			class="item_text">Tabs</span></span></a></li>
																<li id="nav-menu-item-1420"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/buttons/"
																	class=""><span class="item_outer"><span
																			class="item_text">Buttons</span></span></a></li>
																<li id="nav-menu-item-1431"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/icon-with-text/"
																	class=""><span class="item_outer"><span
																			class="item_text">Icon With Text</span></span></a></li>
																<li id="nav-menu-item-1424"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/contact-form/"
																	class=""><span class="item_outer"><span
																			class="item_text">Contact Form</span></span></a></li>
																<li id="nav-menu-item-1429"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/google-maps/"
																	class=""><span class="item_outer"><span
																			class="item_text">Google Maps</span></span></a></li>
																<li id="nav-menu-item-1439"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/parallax-section/"
																	class=""><span class="item_outer"><span
																			class="item_text">Parallax Section</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-1449"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">Infographic</span></span></a>
															<ul>
																<li id="nav-menu-item-1446"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/testimonials/"
																	class=""><span class="item_outer"><span
																			class="item_text">Testimonials</span></span></a></li>
																<li id="nav-menu-item-1441"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/progress-bar/"
																	class=""><span class="item_outer"><span
																			class="item_text">Progress Bar</span></span></a></li>
																<li id="nav-menu-item-1426"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/counters/"
																	class=""><span class="item_outer"><span
																			class="item_text">Counters</span></span></a></li>
																<li id="nav-menu-item-1425"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/countdown/"
																	class=""><span class="item_outer"><span
																			class="item_text">Countdown</span></span></a></li>
																<li id="nav-menu-item-1432"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/image-gallery/"
																	class=""><span class="item_outer"><span
																			class="item_text">Image Gallery</span></span></a></li>
																<li id="nav-menu-item-1419"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/blog-list/"
																	class=""><span class="item_outer"><span
																			class="item_text">Blog List</span></span></a></li>
																<li id="nav-menu-item-1444"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/shop-list/"
																	class=""><span class="item_outer"><span
																			class="item_text">Shop List</span></span></a></li>
															</ul></li>
														<li id="nav-menu-item-1450"
															class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
															href="#" class=" no_link"
															onclick="JavaScript: return false;"><span
																class="item_outer"><span class="item_text">Typography</span></span></a>
															<ul>
																<li id="nav-menu-item-1430"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/headings/"
																	class=""><span class="item_outer"><span
																			class="item_text">Headings</span></span></a></li>
																<li id="nav-menu-item-1423"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/columns/"
																	class=""><span class="item_outer"><span
																			class="item_text">Columns</span></span></a></li>
																<li id="nav-menu-item-1442"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/section-title/"
																	class=""><span class="item_outer"><span
																			class="item_text">Section Title</span></span></a></li>
																<li id="nav-menu-item-1418"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/blockquote/"
																	class=""><span class="item_outer"><span
																			class="item_text">Blockquote</span></span></a></li>
																<li id="nav-menu-item-1428"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/dropcaps-highlights/"
																	class=""><span class="item_outer"><span
																			class="item_text">Dropcaps &#038; Highlights</span></span></a></li>
																<li id="nav-menu-item-1443"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/separators/"
																	class=""><span class="item_outer"><span
																			class="item_text">Separators</span></span></a></li>
																<li id="nav-menu-item-1427"
																	class="menu-item menu-item-type-post_type menu-item-object-page "><a
																	href="https://urbango.qodeinteractive.com/elements/custom-fonts/"
																	class=""><span class="item_outer"><span
																			class="item_text">Custom Fonts</span></span></a></li>
															</ul></li>
													</ul>
												</div>
											</div></li>
									</ul>
								</nav>
<!-- 								<div class="edgtf-wishlist-dropdown-holder edgtf-wd-no-items">
									<div class="edgtf-wd-inner">
										<a itemprop="url" href="#" class="edgtf-wd-link"> <span
											class="edgtf-wd-link-inner"> <i
												class="edgtf-icon-font-awesome far fa-heart edgtf-wd-icon"></i>
												<span class="edgtf-wd-number-of-items">0</span>
										</span>
										</a>
										<div class="edgtf-wd-items-holder">
											<div class="edgtf-wd-items"></div>
										</div>
									</div>
								</div> -->
<!-- 								<a
									class="edgtf-search-opener edgtf-icon-has-hover edgtf-search-opener-icon-pack"
									href="javascript:void(0)"> <span
									class="edgtf-search-opener-wrapper"> <i
										class="edgtf-icon-font-awesome fa fa-search "></i>
								</span>
								</a> -->
							</div>
						</div>
					</div>
				</div>
				<div class="edgtf-sticky-header">
					<div class="edgtf-sticky-holder edgtf-menu-right">
						<div class="edgtf-vertical-align-containers">
							<div class="edgtf-position-left">
								<div class="edgtf-position-left-inner">
									<div class="edgtf-logo-wrapper">
										<a itemprop="url" href="https://urbango.qodeinteractive.com/"
											style="height: 41px;"> <img itemprop="image"
											class="edgtf-normal-logo"
											src="${pageContext.request.contextPath}/resources/images/home/logo.png"
											alt="logo" /> <img itemprop="image" class="edgtf-dark-logo"
											src="${pageContext.request.contextPath}/resources/images/home/logo.png"
											alt="dark logo" /> <img itemprop="image"
											class="edgtf-light-logo"
											src="${pageContext.request.contextPath}/resources/images/home/logo_white.png"
											alt="light logo" />
										</a>
									</div>
								</div>
							</div>
							<div class="edgtf-position-right">
								<div class="edgtf-position-right-inner">
									<nav class="edgtf-main-menu edgtf-drop-down edgtf-sticky-nav">
										<ul id="menu-main-menu-navigation-1" class="clearfix">
											<li id="sticky-nav-menu-item-36"
												class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-31 current_page_item edgtf-active-item narrow"><a
												href="https://urbango.qodeinteractive.com/"
												class=" current "><span class="item_outer"><span
														class="item_text">Home</span><span class="plus"></span></span></a></li>
											<li id="sticky-nav-menu-item-1168"
												class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
												href="#" class=""><span class="item_outer"><span
														class="item_text">Pages</span><span class="plus"></span><i
														class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
												<div class="second">
													<div class="inner">
														<ul>
															<li id="sticky-nav-menu-item-1167"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/get-to-know-us/"
																class=""><span class="item_outer"><span
																		class="item_text">Get to know us</span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-1165"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/how-it-works/"
																class=""><span class="item_outer"><span
																		class="item_text">How It Works</span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-1166"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/contact-us/"
																class=""><span class="item_outer"><span
																		class="item_text">Contact Us</span><span class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-1787"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/our-top-authors/"
																class=""><span class="item_outer"><span
																		class="item_text">Our Top Authors<i
																			class="edgtf-menu-featured-icon fa fa-star"></i></span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-1726"
																class="menu-item menu-item-type-custom menu-item-object-custom "><a
																href="https://urbango.qodeinteractive.com/404" class=""><span
																	class="item_outer"><span class="item_text">404
																			Error Page</span><span class="plus"></span></span></a></li>
														</ul>
													</div>
												</div></li>
											<li id="sticky-nav-menu-item-40"
												class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
												href="#" class=" no_link"
												onclick="JavaScript: return false;"><span
													class="item_outer"><span class="item_text">Listings</span><span
														class="plus"></span><i
														class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
												<div class="second">
													<div class="inner">
														<ul>
															<li id="sticky-nav-menu-item-1474"
																class="menu-item menu-item-type-custom menu-item-object-custom "><a
																href="https://urbango.qodeinteractive.com/listing-item/the-aeon-hall/"
																class=""><span class="item_outer"><span
																		class="item_text">Listing Item<i
																			class="edgtf-menu-featured-icon fa fa-star"></i></span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-140"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">By
																			Location</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-138"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/chelsea/"
																		class=""><span class="item_outer"><span
																				class="item_text">Chelsea<i
																					class="edgtf-menu-featured-icon fa fa-star"></i></span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-135"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/soho/"
																		class=""><span class="item_outer"><span
																				class="item_text">SoHo</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-136"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/tribeca/"
																		class=""><span class="item_outer"><span
																				class="item_text">TriBeCa</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-130"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/harlem/"
																		class=""><span class="item_outer"><span
																				class="item_text">Harlem</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-127"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/midtown/"
																		class=""><span class="item_outer"><span
																				class="item_text">Midtown</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-133"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/east-village/"
																		class=""><span class="item_outer"><span
																				class="item_text">East Village</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-132"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/little-italy/"
																		class=""><span class="item_outer"><span
																				class="item_text">Little Italy</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-129"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/greenwich-village/"
																		class=""><span class="item_outer"><span
																				class="item_text">Greenwich Village</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-128"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/financial-district/"
																		class=""><span class="item_outer"><span
																				class="item_text">Financial District</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-137"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/flatiron-district/"
																		class=""><span class="item_outer"><span
																				class="item_text">Flatiron District</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-139"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/upper-east-side/"
																		class=""><span class="item_outer"><span
																				class="item_text">Upper East Side</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-131"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
																		href="https://urbango.qodeinteractive.com/listing-location/upper-west-side/"
																		class=""><span class="item_outer"><span
																				class="item_text">Upper West Side</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-122"
																class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
																href="https://urbango.qodeinteractive.com/listing-category/culture/"
																class=""><span class="item_outer"><span
																		class="item_text">Culture</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-149"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/art-gallery/"
																		class=""><span class="item_outer"><span
																				class="item_text">Art Gallery</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-150"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/exhibition/"
																		class=""><span class="item_outer"><span
																				class="item_text">Exhibition</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-151"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/lectures/"
																		class=""><span class="item_outer"><span
																				class="item_text">Lectures</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-152"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/performances/"
																		class=""><span class="item_outer"><span
																				class="item_text">Performances</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-117"
																class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
																href="https://urbango.qodeinteractive.com/listing-category/cuisine/"
																class=""><span class="item_outer"><span
																		class="item_text">Cuisine</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-118"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/asian/"
																		class=""><span class="item_outer"><span
																				class="item_text">Asian</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-119"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/cafe/"
																		class=""><span class="item_outer"><span
																				class="item_text">Café</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-120"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/italian/"
																		class=""><span class="item_outer"><span
																				class="item_text">Italian</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-121"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/catering/"
																		class=""><span class="item_outer"><span
																				class="item_text">Catering</span><span class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-123"
																class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
																href="https://urbango.qodeinteractive.com/listing-category/nightlife/"
																class=""><span class="item_outer"><span
																		class="item_text">Nightlife</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-153"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/bars/"
																		class=""><span class="item_outer"><span
																				class="item_text">Bars</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-154"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/clubs/"
																		class=""><span class="item_outer"><span
																				class="item_text">Clubs</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-155"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/live-music/"
																		class=""><span class="item_outer"><span
																				class="item_text">Live Music</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-156"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/private-parties/"
																		class=""><span class="item_outer"><span
																				class="item_text">Private Parties</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-116"
																class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
																href="https://urbango.qodeinteractive.com/listing-category/coworking/"
																class=""><span class="item_outer"><span
																		class="item_text">Coworking</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-145"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/all-inclusive/"
																		class=""><span class="item_outer"><span
																				class="item_text">All Inclusive</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-146"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/hot-desking/"
																		class=""><span class="item_outer"><span
																				class="item_text">Hot Desking</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-147"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/conference-space/"
																		class=""><span class="item_outer"><span
																				class="item_text">Conference Space</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-148"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/shared-space/"
																		class=""><span class="item_outer"><span
																				class="item_text">Shared Space</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-125"
																class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
																href="https://urbango.qodeinteractive.com/listing-category/tours/"
																class=""><span class="item_outer"><span
																		class="item_text">Tours</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-161"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/camping/"
																		class=""><span class="item_outer"><span
																				class="item_text">Camping</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-162"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/city-tours/"
																		class=""><span class="item_outer"><span
																				class="item_text">City Tours</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-163"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/trekking/"
																		class=""><span class="item_outer"><span
																				class="item_text">Trekking</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-164"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/sightseeing/"
																		class=""><span class="item_outer"><span
																				class="item_text">Sightseeing</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-124"
																class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
																href="https://urbango.qodeinteractive.com/listing-category/shopping/"
																class=""><span class="item_outer"><span
																		class="item_text">Shopping</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-157"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/arts-crafts/"
																		class=""><span class="item_outer"><span
																				class="item_text">Arts &#038; Crafts</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-158"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/malls/"
																		class=""><span class="item_outer"><span
																				class="item_text">Malls</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-159"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/markets/"
																		class=""><span class="item_outer"><span
																				class="item_text">Markets</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-160"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/vintage-stores/"
																		class=""><span class="item_outer"><span
																				class="item_text">Vintage Stores</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-115"
																class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children sub"><a
																href="https://urbango.qodeinteractive.com/listing-category/beauty/"
																class=""><span class="item_outer"><span
																		class="item_text">Beauty</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-141"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/cosmetics-shop/"
																		class=""><span class="item_outer"><span
																				class="item_text">Cosmetics Shop</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-142"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/hair-salons/"
																		class=""><span class="item_outer"><span
																				class="item_text">Hair Salons</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-143"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/manicure/"
																		class=""><span class="item_outer"><span
																				class="item_text">Manicure</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-144"
																		class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
																		href="https://urbango.qodeinteractive.com/listing-category/wellness/"
																		class=""><span class="item_outer"><span
																				class="item_text">Wellness</span><span class="plus"></span></span></a></li>
																</ul></li>
														</ul>
													</div>
												</div></li>
											<li id="sticky-nav-menu-item-42"
												class="menu-item menu-item-type-post_type menu-item-object-page  narrow"><a
												href="https://urbango.qodeinteractive.com/pricing-package/"
												class=""><span class="item_outer"><span
														class="item_text">Pricing</span><span class="plus"></span></span></a></li>
											<li id="sticky-nav-menu-item-37"
												class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
												href="#" class=" no_link"
												onclick="JavaScript: return false;"><span
													class="item_outer"><span class="item_text">Blog</span><span
														class="plus"></span><i
														class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
												<div class="second">
													<div class="inner">
														<ul>
															<li id="sticky-nav-menu-item-413"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/blog/right-sidebar/"
																class=""><span class="item_outer"><span
																		class="item_text">Right Sidebar</span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-412"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/blog/left-sidebar/"
																class=""><span class="item_outer"><span
																		class="item_text">Left Sidebar</span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-411"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/blog/no-sidebar/"
																class=""><span class="item_outer"><span
																		class="item_text">No Sidebar</span><span class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-414"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">Post
																			Types</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-415"
																		class="menu-item menu-item-type-post_type menu-item-object-post "><a
																		href="https://urbango.qodeinteractive.com/delicious-coffee/"
																		class=""><span class="item_outer"><span
																				class="item_text">Standard</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-416"
																		class="menu-item menu-item-type-post_type menu-item-object-post "><a
																		href="https://urbango.qodeinteractive.com/theory-and-practice/"
																		class=""><span class="item_outer"><span
																				class="item_text">Gallery</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-418"
																		class="menu-item menu-item-type-post_type menu-item-object-post "><a
																		href="https://urbango.qodeinteractive.com/best-of-the-web/"
																		class=""><span class="item_outer"><span
																				class="item_text">Link</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-417"
																		class="menu-item menu-item-type-post_type menu-item-object-post "><a
																		href="https://urbango.qodeinteractive.com/world-traveler/"
																		class=""><span class="item_outer"><span
																				class="item_text">Quote</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-419"
																		class="menu-item menu-item-type-post_type menu-item-object-post "><a
																		href="https://urbango.qodeinteractive.com/truly-creative/"
																		class=""><span class="item_outer"><span
																				class="item_text">Audio</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-420"
																		class="menu-item menu-item-type-post_type menu-item-object-post "><a
																		href="https://urbango.qodeinteractive.com/providing-the-vision/"
																		class=""><span class="item_outer"><span
																				class="item_text">Video</span><span class="plus"></span></span></a></li>
																</ul></li>
														</ul>
													</div>
												</div></li>
											<li id="sticky-nav-menu-item-38"
												class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow"><a
												href="#" class=" no_link"
												onclick="JavaScript: return false;"><span
													class="item_outer"><span class="item_text">Shop</span><span
														class="plus"></span><i
														class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
												<div class="second">
													<div class="inner">
														<ul>
															<li id="sticky-nav-menu-item-559"
																class="menu-item menu-item-type-post_type menu-item-object-page "><a
																href="https://urbango.qodeinteractive.com/product-list/"
																class=""><span class="item_outer"><span
																		class="item_text">Product List</span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-563"
																class="menu-item menu-item-type-custom menu-item-object-custom "><a
																href="https://urbango.qodeinteractive.com/product/italian-salad/"
																class=""><span class="item_outer"><span
																		class="item_text">Product Single</span><span
																		class="plus"></span></span></a></li>
															<li id="sticky-nav-menu-item-564"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">Shop
																			Layouts</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-562"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/product-list/three-columns/"
																		class=""><span class="item_outer"><span
																				class="item_text">Three Columns</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-560"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/product-list/four-columns/"
																		class=""><span class="item_outer"><span
																				class="item_text">Four Columns</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-561"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/product-list/full-width/"
																		class=""><span class="item_outer"><span
																				class="item_text">Full Width</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-80"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">Shop
																			Pages</span><span class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-77"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/my-account/"
																		class=""><span class="item_outer"><span
																				class="item_text">My account</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-79"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/cart/"
																		class=""><span class="item_outer"><span
																				class="item_text">Cart</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-78"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/checkout/"
																		class=""><span class="item_outer"><span
																				class="item_text">Checkout</span><span class="plus"></span></span></a></li>
																</ul></li>
														</ul>
													</div>
												</div></li>
											<li id="sticky-nav-menu-item-39"
												class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub wide"><a
												href="#" class=" no_link"
												onclick="JavaScript: return false;"><span
													class="item_outer"><span class="item_text">Elements</span><span
														class="plus"></span><i
														class="edgtf-menu-arrow fa fa-angle-down"></i></span></a>
												<div class="second">
													<div class="inner">
														<ul>
															<li id="sticky-nav-menu-item-1447"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">Features</span><span
																		class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-1421"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/category-list/"
																		class=""><span class="item_outer"><span
																				class="item_text">Category List</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1433"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/listing-list/"
																		class=""><span class="item_outer"><span
																				class="item_text">Listing List</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1434"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/listing-packages/"
																		class=""><span class="item_outer"><span
																				class="item_text">Listing Packages</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1437"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/location-list/"
																		class=""><span class="item_outer"><span
																				class="item_text">Location List</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1436"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/location-banner/"
																		class=""><span class="item_outer"><span
																				class="item_text">Location Banner</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1438"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/map-with-listings/"
																		class=""><span class="item_outer"><span
																				class="item_text">Map With Listings</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1422"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/category-tabs/"
																		class=""><span class="item_outer"><span
																				class="item_text">Category Tabs</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1435"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/listing-search/"
																		class=""><span class="item_outer"><span
																				class="item_text">Listing Search<i
																					class="edgtf-menu-featured-icon fa fa-star"></i></span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1417"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/author-list/"
																		class=""><span class="item_outer"><span
																				class="item_text">Author List</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-1448"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">Classic</span><span
																		class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-1416"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/accordions/"
																		class=""><span class="item_outer"><span
																				class="item_text">Accordions</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1445"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/tabs/"
																		class=""><span class="item_outer"><span
																				class="item_text">Tabs</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1420"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/buttons/"
																		class=""><span class="item_outer"><span
																				class="item_text">Buttons</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1431"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/icon-with-text/"
																		class=""><span class="item_outer"><span
																				class="item_text">Icon With Text</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1424"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/contact-form/"
																		class=""><span class="item_outer"><span
																				class="item_text">Contact Form</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1429"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/google-maps/"
																		class=""><span class="item_outer"><span
																				class="item_text">Google Maps</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1439"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/parallax-section/"
																		class=""><span class="item_outer"><span
																				class="item_text">Parallax Section</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-1449"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">Infographic</span><span
																		class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-1446"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/testimonials/"
																		class=""><span class="item_outer"><span
																				class="item_text">Testimonials</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1441"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/progress-bar/"
																		class=""><span class="item_outer"><span
																				class="item_text">Progress Bar</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1426"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/counters/"
																		class=""><span class="item_outer"><span
																				class="item_text">Counters</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1425"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/countdown/"
																		class=""><span class="item_outer"><span
																				class="item_text">Countdown</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1432"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/image-gallery/"
																		class=""><span class="item_outer"><span
																				class="item_text">Image Gallery</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1419"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/blog-list/"
																		class=""><span class="item_outer"><span
																				class="item_text">Blog List</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1444"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/shop-list/"
																		class=""><span class="item_outer"><span
																				class="item_text">Shop List</span><span class="plus"></span></span></a></li>
																</ul></li>
															<li id="sticky-nav-menu-item-1450"
																class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children sub"><a
																href="#" class=" no_link"
																onclick="JavaScript: return false;"><span
																	class="item_outer"><span class="item_text">Typography</span><span
																		class="plus"></span></span></a>
																<ul>
																	<li id="sticky-nav-menu-item-1430"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/headings/"
																		class=""><span class="item_outer"><span
																				class="item_text">Headings</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1423"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/columns/"
																		class=""><span class="item_outer"><span
																				class="item_text">Columns</span><span class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1442"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/section-title/"
																		class=""><span class="item_outer"><span
																				class="item_text">Section Title</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1418"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/blockquote/"
																		class=""><span class="item_outer"><span
																				class="item_text">Blockquote</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1428"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/dropcaps-highlights/"
																		class=""><span class="item_outer"><span
																				class="item_text">Dropcaps &#038; Highlights</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1443"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/separators/"
																		class=""><span class="item_outer"><span
																				class="item_text">Separators</span><span
																				class="plus"></span></span></a></li>
																	<li id="sticky-nav-menu-item-1427"
																		class="menu-item menu-item-type-post_type menu-item-object-page "><a
																		href="https://urbango.qodeinteractive.com/elements/custom-fonts/"
																		class=""><span class="item_outer"><span
																				class="item_text">Custom Fonts</span><span
																				class="plus"></span></span></a></li>
																</ul></li>
														</ul>
													</div>
												</div></li>
										</ul>
									</nav>
									<a
										class="edgtf-search-opener edgtf-icon-has-hover edgtf-search-opener-icon-pack"
										href="javascript:void(0)"> <span
										class="edgtf-search-opener-wrapper"> <i
											class="edgtf-icon-font-awesome fa fa-search "></i>
									</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="edgtf-slide-from-header-bottom-holder">
					<form action="https://urbango.qodeinteractive.com/" method="get">
						<div class="edgtf-form-holder">
							<input type="text" placeholder="Search here..." name="s"
								class="edgtf-search-field" autocomplete="off" required />
							<button type="submit"
								class="edgtf-search-submit edgtf-search-submit-icon-pack">
								<i class="edgtf-icon-font-awesome fa fa-search "></i>
							</button>
						</div>
					</form>
				</div>
			</header>
			<header class="edgtf-mobile-header">
				<div class="edgtf-mobile-header-inner">
					<div class="edgtf-mobile-header-holder">
						<div class="edgtf-grid">
							<div class="edgtf-vertical-align-containers">
								<div class="edgtf-vertical-align-containers">
									<div class="edgtf-position-left">
										<div class="edgtf-position-left-inner">
											<div class="edgtf-mobile-logo-wrapper">
												<a itemprop="url"
													href="https://urbango.qodeinteractive.com/"
													style="height: 41px"> <img itemprop="image"
													src="${pageContext.request.contextPath}/resources/images/home/logo.png"
													alt="Mobile Logo" />
												</a>
											</div>
										</div>
									</div>
									<div
										class="edgtf-mobile-menu-opener edgtf-mobile-menu-opener-icon-pack">
										<a href="javascript:void(0)"> <span
											class="edgtf-mobile-menu-icon"> <i
												class="edgtf-icon-font-awesome fa fa-bars "></i>
										</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<nav class="edgtf-mobile-nav">
						<div class="edgtf-grid">
							<ul id="menu-main-menu-navigation-2" class="">
								<li id="mobile-menu-item-36"
									class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-31 current_page_item edgtf-active-item"><a
									href="https://urbango.qodeinteractive.com/" class=" current "><span>Home</span></a></li>
								<li id="mobile-menu-item-1168"
									class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><a
									href="#" class=" edgtf-mobile-no-link"><span>Pages</span></a><span
									class="mobile_arrow"><i
										class="edgtf-sub-arrow arrow_carrot-right"></i><i
										class="arrow_carrot-down"></i></span>
									<ul class="sub_menu">
										<li id="mobile-menu-item-1167"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/get-to-know-us/"
											class=""><span>Get to know us</span></a></li>
										<li id="mobile-menu-item-1165"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/how-it-works/"
											class=""><span>How It Works</span></a></li>
										<li id="mobile-menu-item-1166"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/contact-us/"
											class=""><span>Contact Us</span></a></li>
										<li id="mobile-menu-item-1787"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/our-top-authors/"
											class=""><span>Our Top Authors</span></a></li>
										<li id="mobile-menu-item-1726"
											class="menu-item menu-item-type-custom menu-item-object-custom "><a
											href="https://urbango.qodeinteractive.com/404" class=""><span>404
													Error Page</span></a></li>
									</ul></li>
								<li id="mobile-menu-item-40"
									class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
										<span>Listings</span>
									</h6>
									<span class="mobile_arrow"><i
										class="edgtf-sub-arrow arrow_carrot-right"></i><i
										class="arrow_carrot-down"></i></span>
									<ul class="sub_menu">
										<li id="mobile-menu-item-1474"
											class="menu-item menu-item-type-custom menu-item-object-custom "><a
											href="https://urbango.qodeinteractive.com/listing-item/the-aeon-hall/"
											class=""><span>Listing Item</span></a></li>
										<li id="mobile-menu-item-140"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>By Location</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-138"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/chelsea/"
													class=""><span>Chelsea</span></a></li>
												<li id="mobile-menu-item-135"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/soho/"
													class=""><span>SoHo</span></a></li>
												<li id="mobile-menu-item-136"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/tribeca/"
													class=""><span>TriBeCa</span></a></li>
												<li id="mobile-menu-item-130"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/harlem/"
													class=""><span>Harlem</span></a></li>
												<li id="mobile-menu-item-127"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/midtown/"
													class=""><span>Midtown</span></a></li>
												<li id="mobile-menu-item-133"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/east-village/"
													class=""><span>East Village</span></a></li>
												<li id="mobile-menu-item-132"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/little-italy/"
													class=""><span>Little Italy</span></a></li>
												<li id="mobile-menu-item-129"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/greenwich-village/"
													class=""><span>Greenwich Village</span></a></li>
												<li id="mobile-menu-item-128"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/financial-district/"
													class=""><span>Financial District</span></a></li>
												<li id="mobile-menu-item-137"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/flatiron-district/"
													class=""><span>Flatiron District</span></a></li>
												<li id="mobile-menu-item-139"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/upper-east-side/"
													class=""><span>Upper East Side</span></a></li>
												<li id="mobile-menu-item-131"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-location "><a
													href="https://urbango.qodeinteractive.com/listing-location/upper-west-side/"
													class=""><span>Upper West Side</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-122"
											class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children  has_sub"><a
											href="https://urbango.qodeinteractive.com/listing-category/culture/"
											class=""><span>Culture</span></a><span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-149"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/art-gallery/"
													class=""><span>Art Gallery</span></a></li>
												<li id="mobile-menu-item-150"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/exhibition/"
													class=""><span>Exhibition</span></a></li>
												<li id="mobile-menu-item-151"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/lectures/"
													class=""><span>Lectures</span></a></li>
												<li id="mobile-menu-item-152"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/performances/"
													class=""><span>Performances</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-117"
											class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children  has_sub"><a
											href="https://urbango.qodeinteractive.com/listing-category/cuisine/"
											class=""><span>Cuisine</span></a><span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-118"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/asian/"
													class=""><span>Asian</span></a></li>
												<li id="mobile-menu-item-119"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/cafe/"
													class=""><span>Café</span></a></li>
												<li id="mobile-menu-item-120"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/italian/"
													class=""><span>Italian</span></a></li>
												<li id="mobile-menu-item-121"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/catering/"
													class=""><span>Catering</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-123"
											class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children  has_sub"><a
											href="https://urbango.qodeinteractive.com/listing-category/nightlife/"
											class=""><span>Nightlife</span></a><span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-153"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/bars/"
													class=""><span>Bars</span></a></li>
												<li id="mobile-menu-item-154"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/clubs/"
													class=""><span>Clubs</span></a></li>
												<li id="mobile-menu-item-155"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/live-music/"
													class=""><span>Live Music</span></a></li>
												<li id="mobile-menu-item-156"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/private-parties/"
													class=""><span>Private Parties</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-116"
											class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children  has_sub"><a
											href="https://urbango.qodeinteractive.com/listing-category/coworking/"
											class=""><span>Coworking</span></a><span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-145"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/all-inclusive/"
													class=""><span>All Inclusive</span></a></li>
												<li id="mobile-menu-item-146"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/hot-desking/"
													class=""><span>Hot Desking</span></a></li>
												<li id="mobile-menu-item-147"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/conference-space/"
													class=""><span>Conference Space</span></a></li>
												<li id="mobile-menu-item-148"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/shared-space/"
													class=""><span>Shared Space</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-125"
											class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children  has_sub"><a
											href="https://urbango.qodeinteractive.com/listing-category/tours/"
											class=""><span>Tours</span></a><span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-161"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/camping/"
													class=""><span>Camping</span></a></li>
												<li id="mobile-menu-item-162"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/city-tours/"
													class=""><span>City Tours</span></a></li>
												<li id="mobile-menu-item-163"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/trekking/"
													class=""><span>Trekking</span></a></li>
												<li id="mobile-menu-item-164"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/sightseeing/"
													class=""><span>Sightseeing</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-124"
											class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children  has_sub"><a
											href="https://urbango.qodeinteractive.com/listing-category/shopping/"
											class=""><span>Shopping</span></a><span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-157"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/arts-crafts/"
													class=""><span>Arts &#038; Crafts</span></a></li>
												<li id="mobile-menu-item-158"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/malls/"
													class=""><span>Malls</span></a></li>
												<li id="mobile-menu-item-159"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/markets/"
													class=""><span>Markets</span></a></li>
												<li id="mobile-menu-item-160"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/vintage-stores/"
													class=""><span>Vintage Stores</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-115"
											class="menu-item menu-item-type-taxonomy menu-item-object-listing-category menu-item-has-children  has_sub"><a
											href="https://urbango.qodeinteractive.com/listing-category/beauty/"
											class=""><span>Beauty</span></a><span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-141"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/cosmetics-shop/"
													class=""><span>Cosmetics Shop</span></a></li>
												<li id="mobile-menu-item-142"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/hair-salons/"
													class=""><span>Hair Salons</span></a></li>
												<li id="mobile-menu-item-143"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/manicure/"
													class=""><span>Manicure</span></a></li>
												<li id="mobile-menu-item-144"
													class="menu-item menu-item-type-taxonomy menu-item-object-listing-category "><a
													href="https://urbango.qodeinteractive.com/listing-category/wellness/"
													class=""><span>Wellness</span></a></li>
											</ul></li>
									</ul></li>
								<li id="mobile-menu-item-42"
									class="menu-item menu-item-type-post_type menu-item-object-page "><a
									href="https://urbango.qodeinteractive.com/pricing-package/"
									class=""><span>Pricing</span></a></li>
								<li id="mobile-menu-item-37"
									class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
										<span>Blog</span>
									</h6>
									<span class="mobile_arrow"><i
										class="edgtf-sub-arrow arrow_carrot-right"></i><i
										class="arrow_carrot-down"></i></span>
									<ul class="sub_menu">
										<li id="mobile-menu-item-413"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/blog/right-sidebar/"
											class=""><span>Right Sidebar</span></a></li>
										<li id="mobile-menu-item-412"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/blog/left-sidebar/"
											class=""><span>Left Sidebar</span></a></li>
										<li id="mobile-menu-item-411"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/blog/no-sidebar/"
											class=""><span>No Sidebar</span></a></li>
										<li id="mobile-menu-item-414"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>Post Types</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-415"
													class="menu-item menu-item-type-post_type menu-item-object-post "><a
													href="https://urbango.qodeinteractive.com/delicious-coffee/"
													class=""><span>Standard</span></a></li>
												<li id="mobile-menu-item-416"
													class="menu-item menu-item-type-post_type menu-item-object-post "><a
													href="https://urbango.qodeinteractive.com/theory-and-practice/"
													class=""><span>Gallery</span></a></li>
												<li id="mobile-menu-item-418"
													class="menu-item menu-item-type-post_type menu-item-object-post "><a
													href="https://urbango.qodeinteractive.com/best-of-the-web/"
													class=""><span>Link</span></a></li>
												<li id="mobile-menu-item-417"
													class="menu-item menu-item-type-post_type menu-item-object-post "><a
													href="https://urbango.qodeinteractive.com/world-traveler/"
													class=""><span>Quote</span></a></li>
												<li id="mobile-menu-item-419"
													class="menu-item menu-item-type-post_type menu-item-object-post "><a
													href="https://urbango.qodeinteractive.com/truly-creative/"
													class=""><span>Audio</span></a></li>
												<li id="mobile-menu-item-420"
													class="menu-item menu-item-type-post_type menu-item-object-post "><a
													href="https://urbango.qodeinteractive.com/providing-the-vision/"
													class=""><span>Video</span></a></li>
											</ul></li>
									</ul></li>
								<li id="mobile-menu-item-38"
									class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
										<span>Shop</span>
									</h6>
									<span class="mobile_arrow"><i
										class="edgtf-sub-arrow arrow_carrot-right"></i><i
										class="arrow_carrot-down"></i></span>
									<ul class="sub_menu">
										<li id="mobile-menu-item-559"
											class="menu-item menu-item-type-post_type menu-item-object-page "><a
											href="https://urbango.qodeinteractive.com/product-list/"
											class=""><span>Product List</span></a></li>
										<li id="mobile-menu-item-563"
											class="menu-item menu-item-type-custom menu-item-object-custom "><a
											href="https://urbango.qodeinteractive.com/product/italian-salad/"
											class=""><span>Product Single</span></a></li>
										<li id="mobile-menu-item-564"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>Shop Layouts</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-562"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/product-list/three-columns/"
													class=""><span>Three Columns</span></a></li>
												<li id="mobile-menu-item-560"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/product-list/four-columns/"
													class=""><span>Four Columns</span></a></li>
												<li id="mobile-menu-item-561"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/product-list/full-width/"
													class=""><span>Full Width</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-80"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>Shop Pages</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-77"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/my-account/"
													class=""><span>My account</span></a></li>
												<li id="mobile-menu-item-79"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/cart/" class=""><span>Cart</span></a></li>
												<li id="mobile-menu-item-78"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/checkout/"
													class=""><span>Checkout</span></a></li>
											</ul></li>
									</ul></li>
								<li id="mobile-menu-item-39"
									class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
										<span>Elements</span>
									</h6>
									<span class="mobile_arrow"><i
										class="edgtf-sub-arrow arrow_carrot-right"></i><i
										class="arrow_carrot-down"></i></span>
									<ul class="sub_menu">
										<li id="mobile-menu-item-1447"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>Features</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-1421"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/category-list/"
													class=""><span>Category List</span></a></li>
												<li id="mobile-menu-item-1433"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/listing-list/"
													class=""><span>Listing List</span></a></li>
												<li id="mobile-menu-item-1434"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/listing-packages/"
													class=""><span>Listing Packages</span></a></li>
												<li id="mobile-menu-item-1437"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/location-list/"
													class=""><span>Location List</span></a></li>
												<li id="mobile-menu-item-1436"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/location-banner/"
													class=""><span>Location Banner</span></a></li>
												<li id="mobile-menu-item-1438"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/map-with-listings/"
													class=""><span>Map With Listings</span></a></li>
												<li id="mobile-menu-item-1422"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/category-tabs/"
													class=""><span>Category Tabs</span></a></li>
												<li id="mobile-menu-item-1435"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/listing-search/"
													class=""><span>Listing Search</span></a></li>
												<li id="mobile-menu-item-1417"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/author-list/"
													class=""><span>Author List</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-1448"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>Classic</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-1416"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/accordions/"
													class=""><span>Accordions</span></a></li>
												<li id="mobile-menu-item-1445"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/tabs/"
													class=""><span>Tabs</span></a></li>
												<li id="mobile-menu-item-1420"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/buttons/"
													class=""><span>Buttons</span></a></li>
												<li id="mobile-menu-item-1431"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/icon-with-text/"
													class=""><span>Icon With Text</span></a></li>
												<li id="mobile-menu-item-1424"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/contact-form/"
													class=""><span>Contact Form</span></a></li>
												<li id="mobile-menu-item-1429"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/google-maps/"
													class=""><span>Google Maps</span></a></li>
												<li id="mobile-menu-item-1439"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/parallax-section/"
													class=""><span>Parallax Section</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-1449"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>Infographic</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-1446"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/testimonials/"
													class=""><span>Testimonials</span></a></li>
												<li id="mobile-menu-item-1441"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/progress-bar/"
													class=""><span>Progress Bar</span></a></li>
												<li id="mobile-menu-item-1426"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/counters/"
													class=""><span>Counters</span></a></li>
												<li id="mobile-menu-item-1425"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/countdown/"
													class=""><span>Countdown</span></a></li>
												<li id="mobile-menu-item-1432"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/image-gallery/"
													class=""><span>Image Gallery</span></a></li>
												<li id="mobile-menu-item-1419"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/blog-list/"
													class=""><span>Blog List</span></a></li>
												<li id="mobile-menu-item-1444"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/shop-list/"
													class=""><span>Shop List</span></a></li>
											</ul></li>
										<li id="mobile-menu-item-1450"
											class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub"><h6>
												<span>Typography</span>
											</h6>
											<span class="mobile_arrow"><i
												class="edgtf-sub-arrow arrow_carrot-right"></i><i
												class="arrow_carrot-down"></i></span>
											<ul class="sub_menu">
												<li id="mobile-menu-item-1430"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/headings/"
													class=""><span>Headings</span></a></li>
												<li id="mobile-menu-item-1423"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/columns/"
													class=""><span>Columns</span></a></li>
												<li id="mobile-menu-item-1442"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/section-title/"
													class=""><span>Section Title</span></a></li>
												<li id="mobile-menu-item-1418"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/blockquote/"
													class=""><span>Blockquote</span></a></li>
												<li id="mobile-menu-item-1428"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/dropcaps-highlights/"
													class=""><span>Dropcaps &#038; Highlights</span></a></li>
												<li id="mobile-menu-item-1443"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/separators/"
													class=""><span>Separators</span></a></li>
												<li id="mobile-menu-item-1427"
													class="menu-item menu-item-type-post_type menu-item-object-page "><a
													href="https://urbango.qodeinteractive.com/elements/custom-fonts/"
													class=""><span>Custom Fonts</span></a></li>
											</ul></li>
									</ul></li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="edgtf-slide-from-header-bottom-holder">
					<form action="https://urbango.qodeinteractive.com/" method="get">
						<div class="edgtf-form-holder">
							<input type="text" placeholder="Search here..." name="s"
								class="edgtf-search-field" autocomplete="off" required />
							<button type="submit"
								class="edgtf-search-submit edgtf-search-submit-icon-pack">
								<i class="edgtf-icon-font-awesome fa fa-search "></i>
							</button>
						</div>
					</form>
				</div>
			</header>


</body>
</html>