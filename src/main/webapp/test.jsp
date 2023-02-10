<%@page import="eating.TestMgr"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="eating.ReviewBean"%>
<jsp:useBean id="rmgr" class="eating.ReviewMgr"/>
<jsp:useBean id="tmgr" class="eating.TestMgr"/>

<%
int rest_id = 10;
Vector<ReviewBean> vlist = rmgr.showReviews(rest_id); 
for(int i=0;i<vlist.size();i++){
	ReviewBean bean = vlist.get(i);	
	out.println(bean.getReview_content());
}
out.print("vlistsize");
out.print(vlist.size());
out.println();
ReviewBean bean = tmgr.testoutput();
out.print(bean.getReview_content());

out.print(2);
%>

