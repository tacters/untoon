<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../common/menubar.jsp"/> 

									<div
										class="vc_row wpb_row vc_row-fluid vc_custom_1533890452168">
										<div class="wpb_column vc_column_container vc_col-sm-12">
											<div class="vc_column-inner">
												<div class="wpb_wrapper">
													<div
														class="edgtf-section-title-holder   edgtf-st-position-center">
														<div class="edgtf-st-inner">
															<span class="edgtf-st-subtitle"
																style="margin-bottom: -7px"> 언투온의 </span>
															<h2 class="edgtf-st-title">실시간 TRENDING 클래스</h2>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
									
									
									<div class="edgtf-row-grid-section-wrapper ">
										<div class="edgtf-row-grid-section">
											<div
												class="vc_row wpb_row vc_row-fluid vc_custom_1533893025905">
												<div class="wpb_column vc_column_container vc_col-sm-12">
													<div class="vc_column-inner">
														<div class="wpb_wrapper">
															<div
																class="edgtf-category-list-holder edgtf-grid-list edgtf-disable-bottom-space edgtf-four-columns edgtf-normal-space">
																<div class="edgtf-cl-inner edgtf-outer-space clearfix">
															
															<c:forEach items="${ requestScope.list }" var="c"  begin = "0" end ="7" varStatus="status">
																<c:url var="cdet" value="/cdetail.do">
																	<c:param name="cid" value="${c.cid}"/>
																</c:url>
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="${pageContext.request.contextPath}/resources/clss_files/${ cl.clss_rename_filename}"
																					class="attachment-full size-full" alt="${c.clss_title }"
																					loading="lazy" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="${ cdet }">${ c.clss_title }</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">
																				인기순 #<c:out value="${status.count}" />! ${ c.tchr_id } 태터즈님의 원데이 클래스</p> 
																				<!-- 자바스크립트 변수로 랜덤 문구 돌리기 ㄱㄱ -->
																				<!-- http://www.java2s.com/Tutorial/Java/0380__JSTL/JSTLForEachLoopwithBeginEndStep.htm -->
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${ cdet }"></a>
																		</div>
																	</article>
																</c:forEach>
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-4.jpg"
																					class="attachment-full size-full" alt="a"
																					loading="lazy"
																					srcset="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-4.jpg 800w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-4-150x150.jpg 150w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-4-300x300.jpg 300w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-4-768x768.jpg 768w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-4-650x650.jpg 650w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-4-100x100.jpg 100w"
																					sizes="(max-width: 800px) 100vw, 800px" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="https://urbango.qodeinteractive.com/listing-category/live-music/">Live
																						Music</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">Lorem
																					ipsum dolor sit amet</p>
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${pageContext.request.contextPath}/tcdetail.do"></a>
																		</div>
																	</article>
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-1.jpg"
																					class="attachment-full size-full" alt="a"
																					loading="lazy"
																					srcset="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-1.jpg 800w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-1-150x150.jpg 150w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-1-300x300.jpg 300w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-1-768x768.jpg 768w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-1-650x650.jpg 650w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-1-100x100.jpg 100w"
																					sizes="(max-width: 800px) 100vw, 800px" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="https://urbango.qodeinteractive.com/listing-category/cuisine/">Cuisine</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">Lorem
																					ipsum dolor sit amet</p>
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${pageContext.request.contextPath}/tcdetail.do"></a>
																		</div>
																	</article>
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-2.jpg"
																					class="attachment-full size-full" alt="a"
																					loading="lazy"
																					srcset="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-2.jpg 800w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-2-150x150.jpg 150w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-2-300x300.jpg 300w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-2-768x768.jpg 768w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-2-650x650.jpg 650w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-2-100x100.jpg 100w"
																					sizes="(max-width: 800px) 100vw, 800px" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="https://urbango.qodeinteractive.com/listing-category/coworking/">Coworking</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">Lorem
																					ipsum dolor sit amet</p>
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${pageContext.request.contextPath}/tcdetail.do"></a>
																		</div>
																	</article>
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-8.jpg"
																					class="attachment-full size-full" alt="a"
																					loading="lazy"
																					srcset="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-8.jpg 800w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-8-150x150.jpg 150w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-8-300x300.jpg 300w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-8-768x768.jpg 768w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-8-650x650.jpg 650w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-8-100x100.jpg 100w"
																					sizes="(max-width: 800px) 100vw, 800px" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="https://urbango.qodeinteractive.com/listing-category/catering/">Catering</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">Lorem
																					ipsum dolor sit amet</p>
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${pageContext.request.contextPath}/tcdetail.do"></a>
																		</div>
																	</article>
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-3.jpg"
																					class="attachment-full size-full" alt="a"
																					loading="lazy"
																					srcset="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-3.jpg 800w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-3-150x150.jpg 150w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-3-300x300.jpg 300w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-3-768x768.jpg 768w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-3-650x650.jpg 650w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-3-100x100.jpg 100w"
																					sizes="(max-width: 800px) 100vw, 800px" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="https://urbango.qodeinteractive.com/listing-category/cafe/">Café</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">Lorem
																					ipsum dolor sit amet</p>
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${pageContext.request.contextPath}/tcdetail.do"></a>
																		</div>
																	</article>
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-5.jpg"
																					class="attachment-full size-full" alt="a"
																					loading="lazy"
																					srcset="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-5.jpg 800w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-5-150x150.jpg 150w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-5-300x300.jpg 300w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-5-768x768.jpg 768w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-5-650x650.jpg 650w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-5-100x100.jpg 100w"
																					sizes="(max-width: 800px) 100vw, 800px" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="https://urbango.qodeinteractive.com/listing-category/bars/">Bars</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">Lorem
																					ipsum dolor sit amet</p>
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${pageContext.request.contextPath}/tcdetail.do"></a>
																		</div>
																	</article>
																	<article class="edgtf-cl-item edgtf-item-space">
																		<div class="edgtf-cl-item-inner">
																			<div class="edgtf-cl-image">
																				<img width="800" height="800"
																					src="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-6.jpg"
																					class="attachment-full size-full" alt="a"
																					loading="lazy"
																					srcset="https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-6.jpg 800w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-6-150x150.jpg 150w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-6-300x300.jpg 300w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-6-768x768.jpg 768w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-6-650x650.jpg 650w, https://urbango.qodeinteractive.com/wp-content/uploads/2018/08/h1-list-img-6-100x100.jpg 100w"
																					sizes="(max-width: 800px) 100vw, 800px" />
																			</div>
																			<div class="edgtf-cl-content">
																				<h4 itemprop="name"
																					class="edgtf-cl-title entry-title">
																					<a itemprop="url"
																						href="https://urbango.qodeinteractive.com/listing-category/art-gallery/">Art
																						Gallery</a>
																				</h4>
																				<p itemprop="description" class="edgtf-cl-excerpt">Lorem
																					ipsum dolor sit amet</p>
																			</div>
																			<a itemprop="url" class="edgtf-cl-link"
																				href="${pageContext.request.contextPath}/tcdetail.do"></a>
																		</div>
																	</article>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

<c:import url="../common/footer.jsp"/>
</body>
</html>