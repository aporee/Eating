<!-- 공지사항 관리자 페이지 리스트 -->
<!-- 공지사항 관리자페이지를 통해서 접속할 것 -->
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="eating.NoticeBoardBean" %>
<jsp:useBean id="nmgr" class="eating.NoticeMgr"/>


<%
	Vector<NoticeBoardBean> vlist = nmgr.showNoticeEditList();
%>
<div class="notice_list">
    <ul>                      
    <%
    for ( int i =0; i < vlist.size(); i++){
    	NoticeBoardBean bean = vlist.get(i);
    	String content = bean.getNotice_content();
    	String date = bean.getNotice_datetime();
    	int post_id = bean.getNotice_id();
    %>
        <li><%=content%></li>
        <li><%=date%></li>
        <a href="javascript:updateFn('<%=num%>')">[수정]</a>
       <input type="submit" value="수정" class="sub_btn sub_btn1">
       <input type="submit" value="삭제" class="sub_btn sub_btn2"> 
       
   <%}//--for %>                    
    </ul>                   
</div>