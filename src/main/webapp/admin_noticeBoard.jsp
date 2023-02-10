<!-- 공지사항 관리자페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<%@ include file="header.jsp"%>
    <section id="content">
        <article class="admin_menu">
            <div class="menu">
                <ul>
                
                
                    <li>
                        <a href="#">가게</a>
                    </li>
                    <li>
                        <a href="#">공지사항</a>
                        <ul class="menu_dep">
                            <li><a href="#">공지사항 목록</a></li>
                            <li><a href="#">공지사항 등록</a></li>
                        </ul>
                    </li>
                    
                    
                    <li>
                        <a href="#">메뉴</a>
                        <ul class="menu_dep">
                            <li><a href="#">메뉴 목록</a></li>
                            <li><a href="#">메뉴 등록</a></li>
                        </ul>
                    </li>
                    
                    
                </ul>
            </div>
        </article>
        <article class="main admin_noticeBoard_list">
            <div class="noticeBoard_main_list">           
                <h2>공지사항</h2>
                <div class="noticeBoard_list">
                    <h3>공지사항 목록</h3>
                    
<%@include file="admin_noticeBoard_list.jsp"%>
                      
                
                   
                </div>
            </div>
        </article>
        <article class="page_btn">
            <div class="paging">
                <a href="#"><<</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#" class="on">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">>></a>
            </div>
        </article>
    </section>
    <!-- <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section> -->
</body>

</html>
