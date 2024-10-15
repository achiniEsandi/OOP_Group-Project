<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search payment details</title>
<style>
     
      body {
        font-family: Arial, sans-serif;
        background-color: #3b89c2;
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        margin: 0;
        padding: 0;
      }
      
     .container {
        width: 100%;
        max-width: 800px;
        padding: 20px;
        text-align: center;
        margin: 0 auto;
     }

      h1 {
        text-align: center;
        margin-top: 50px;
        color: #fff;
        font-size: 28px;
      }
      
      h2 {
       font-size: 32px;
       color: #fff;
       margin-bottom: 20px;
      }
      
     .extra-bold {
       font-weight: 900; 
      }
      
      h3 {
       font-size: 26px;
       color: black;
       margin-bottom: 20px;
      }
      
      p {
       font-size: 20px;
       color: black;
       line-height: 1.6;
       margin-bottom: 15px;
       font-weight: bold;
       line-height: 1;
      }

      form {
        max-width: 300px;
        margin: 0 auto;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8); 
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      label {
        font-weight: bold;
      }

      input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      input[type="text"]:focus {
        outline: none;
        border-color: #007BFF;
      }

      .btncls {
        text-align: center;
      }

      button {
        background-color: #007BFF;
        color: #fff;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      button:hover {
        background-color: #0056b3;
      }
</style>
</head>
<body>

    <div class="container">
    <div class="card">
      <h2>Welcome to Premium Membership!</h2>
 
      <p>Congratulations and welcome to the Premium Membership of <span class="extra-bold">VideoLane</span>!</p>
      <p>You have unlocked a world of enhanced features</p>
      <h3><strong>Happy watching!</strong></h3>
      </div>
      </div>

      
    <h1>Search Payment Details</h1>
    <form action="SearchServlet" method="post">
      <label>Enter name</label>
      <input
        type="text"
        name="name"
        class="form-group"
        placeholder="Enter name"
        required
      /><br /><br />
      <label>Enter email</label>
      <input
        type="text"
        name="email"
        class="form-group"
        placeholder="Enter email"
        required
      /><br />
      <div class="btncls">
       <button type="submit" name='submit'>Search</button>
      </div>
    </form>
  </body>
</html>

