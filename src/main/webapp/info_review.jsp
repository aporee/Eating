<!-- 가게리뷰 -->
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="eating.ReviewBean"%>
<jsp:useBean id="rmgr" class="eating.ReviewMgr"/>

<%
int rest_id = 10;
Vector<ReviewBean> vlist = rmgr.showReviews(rest_id); 
%>

<!DOCTYPE html>
<%@ include file="header.jsp"%>


    <section id="content">
        <article class="영역구별할때 써주세요">
            <div class="wrap">

                <!-- 메인사진 -->
                <div class="main_pic"  style="background-color:#000;">
                </div>

                <h2 class="rname">신당동 떡볶이집</h2>
                <div class="bookmarkshare_box">
                    <div class="bookmarkshare">
                        <div class="bookmark_box">
                        <img src="img/star.png" alt="bookmark" class="bookmark">
                        <h3>북마크</h3>
                        </div>
                        <div class="share_box">
                        <img src="img/share.png" alt="share" class="bookmark">
                        <h3>공유</h3>
                        </div>
                    </div>
                </div>


                <div class="lists">
                    <hr style="color: #D9D9D9;">
                    <ul>
                        <li class="list1">
                            <a href="info_home.html"><h3>홈</h3></a>
                        </li>
                        <li class="list2">
                            <a href="info_notice.html"><h3>공지사항</h3></a>
                        </li>
                        <li class="list3">
                            <a href="info_menu.html"><h3>메뉴</h3></a>
                        </li>
                        <li class="list4">
                            <a href="info_review.html"><h3>리뷰</h3></a>
                        </li>
                    </ul>
                    <!-- <hr style="color: #D9D9D9;"> -->
                </div>


<div class="info_review">
    <h2>리뷰</h2>
    <div class = "info_review_box">
        <ul>
                        
     <% for(int i=0; i < vlist.size(); i++){
     	ReviewBean bean = vlist.get(i);	
     %>
                        	
                        
         <li class="review_lists review_list1">
             <img src="img/menu.png" alt="메뉴사진">
             <div class="reviewcontentsbox">
             
             
                 <h2>
                 <%=bean.getReview_title()%>
                 </h2>
                 
                 <h3>	
                 <%=bean.getReview_content()%>
                 </h3>
                 
             </div>
             <!-- <hr style="color: #D9D9D9;"> -->
         </li>
                            
                        <% 
                        	} //-- for (메뉴 리스트)
                        %>
                        </ul>
                        <ul>
                        </ul>
                    </div>

                </div>

            </div>
        </article>
    </section>
    <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section>
</body>

</html>
