<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment details</title>
<style>

     *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: sans-serif;
}
body{
     background-color:#80deff;
     background-attachment:fixed;
     background-size:cover;
}

table {
        border-collapse: separate;
        border-spacing: 0 10px; 
}
td {
        padding: 10px; 
}
 
.payment{
    background: #f8f8f8;
    max-width: 360px;
    margin: 80px auto;
    height: auto;
    padding: 35px;
    padding-top: 70px;
    border-radius: 5px;
    position: relative;
}
.payment h2{
    text-align: center;
    letter-spacing: 2px;
    margin-bottom: 40px;
    color: #0d3c64;
}
.form .label{
    display: block;
    color: #000000;
    margin-bottom: 6px;
}
.form .input{
    padding: 13px 0 13px 25px;
    width: 100%;
    text-align: center;
    border: 2px solid #dddddd;
    border-radius: 5px;
    letter-spacing: 1px;
    word-wrap: 3px;
    outline: none;
    font-size: 16px;
    color: #555555;
}
.card-grp{
    display: flex;
    justify-content: space-between;
}
.card-item{
    width: 48%;
}
.space{
    margin-bottom: 20px;
}
.icon-relative{
    position: relative;
}
.icon-relative .fas,
.icon-relative .far{
    position: absolute;
    bottom: 12px;
    left: 15px;
    font-size: 20px;
    color: #555555;
}
.order-btn button[type="submit"]{
    width: 300px;
    height: 50px;
    padding: 0.7rem 1.5rem;
    background: #062c4b;
    color: white;
    border: none;
    outline: none;
    margin-top: 1rem;
    cursor: pointer;
}

.styled-button {
        border: 2px solid #000; 
        padding: 10px 20px; 
        font-size: 16px; 
        background-color: #4CAF50; 
        color: white; 
        cursor: pointer; 
        border-radius: 5px; 
}
    
.styled-button:hover {
        background-color: #45a049; 
}

.foot
{
    display: flex;
    justify-content: space-between;
    margin: 20px 0;
    padding: 10px   0;
    border-top: 1px solid #333;
}



</style>
</head>
<body>
     <!-- loop through the list of cusDetails -->
     <c:forEach var="cus" items="${cusDetails}">
	<!-- set variables for each user -->
	<c:set var="id" value="${ cus.id}" />
	<c:set var="cardholdername" value="${ cus.cardholdername}" />
	<c:set var="email" value="${ cus.email}" />
	<c:set var="cardnumber" value="${ cus.cardnumber}" />
	<c:set var="expiredate" value="${ cus.expiredate}" />
	<c:set var="CVVcode" value="${ cus.CVVcode}" />
	<c:set var="amount" value="${ cus.amount}" />
	  
	
	<h1>Payment Details</h1>
<table>
    <tr>
        <td><label for="id">Id</label></td>
        <td><input type="text" value="${cus.id}" readonly /></td>
    </tr>
    
    <tr>
        <td><label for="cardholdername">Card Holder Name</label></td>
        <td><input type="text" value="${cus.cardholdername}" readonly /></td>
    </tr>
   
    <tr>
        <td><label for="email">Email</label></td>
        <td><input type="email" value="${cus.email}" readonly /></td>
    </tr>
    
    <tr>
        <td><label for="cardnumber">Card Number</label></td>
        <td><input type="text" value="${cus.cardnumber}" readonly /></td>
    </tr>
 
    <tr>
        <td><label for="expiredate">Expire Date</label></td>
        <td><input type="text" value="${cus.expiredate}" readonly /></td>
    </tr>
   
    <tr>
        <td><label for="CVVcode">CVV Code</label></td>
        <td><input type="text" value="${cus.CVVcode}" readonly /></td>
    </tr>
   
    <tr>
        <td><label for="amount">Payment Amount</label></td>
        <td><input type="text" value="${cus.amount}" readonly /></td>
    </tr>
</table>

	
	</c:forEach>
	<!-- url for updating user details -->
	<c:url value="Update.jsp" var="cusupdate">
	<!-- pass user details as parameters for updating -->
	<c:param name="id" value="${id}"/>
	<c:param name="cardholdername" value="${cardholdername}"/>
	<c:param name="email" value="${email}"/>
	<c:param name="cardnumber" value="${cardnumber}"/>
	<c:param name="expiredate" value="${expiredate}"/>
	<c:param name="CVVcode" value="${CVVcode}"/>
	<c:param name="Amount" value="${amount}"/>
	
	 </c:url>
	 
	 <a href="${cusupdate}">
    <input type="button" name="update" value="Update Payment Details" class="styled-button">
    </a>
	 <br><br>
	 <!-- url for deleting user details -->
	 <c:url value="Delete.jsp" var="cusdelete">
	 <!-- pass user details as parameters for deleting -->
    <c:param name="id" value="${id}"/>
	<c:param name="cardholdername" value="${cardholdername}"/>
	<c:param name="email" value="${email}"/>
	<c:param name="cardnumber" value="${cardnumber}"/>
	<c:param name="expiredate" value="${expiredate}"/>
	<c:param name="CVVcode" value="${CVVcode}"/>
	<c:param name="Amount" value="${amount}"/>
	
	 </c:url>
	 
	  <a href="${cusdelete}">
      <input type="button" name="delete" value="Delete payment details" class="styled-button">
      </a>

</body>
</html>