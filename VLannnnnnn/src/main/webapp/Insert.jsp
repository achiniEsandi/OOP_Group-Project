<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert payment details</title>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: sans-serif;
}
body{
    background: #062c4b ;
    margin:0 10px
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
     
      <div class="wrapper">
            <div class="payment">
                <h2>Payment Gateway</h2>
                 <form action="InsertServlet" method="post"  onsubmit="return validateForm()">
                <div class="form">
                
                    <div class="card space icon-relative">
                        <label class="label">Card Holder Name</label>
                        <input type="text" class="input" Id="cardholdername" name="cardholder" placeholder="Enter Card Holder Name" required>
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="card space icon-relative">
                        <label class="label">Card Holder Email</label>
                        <input type="text" class="input" Id="email" name="email" placeholder="Enter Card Holder Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" required>
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="card space icon-relative">
                        <label class="label">Card Number</label>
                        <input type="text" class="input" Id="cardnumber" name="cardnumber" placeholder="Enter Card Number" required>
                        <i class="far fa-credit-card"></i>
                    </div>
                    <div class="card-grp space">
                        <div class="card-item icon-relative">
                            <label class="label">Expire Date</label>
                            <input type="text" class="input" Id="exp" name="expiredate" placeholder="MM/YY" required>
                            <i class="far fa-calendar-alt"></i>
                        </div>
                        <div class="card-item icon-relative">
                            <label class="label">CVV</label>
                            <input type="text" class="input" Id="cvv" name="cvv" placeholder="000" required>
                            <i class="fas fa-lock"></i>
                        </div>
                    </div>
                     <label for="amount">Amount</label>
                        <select id="amount" name="amount" required>
                         <option value="1000">1000</option>
                         <option value="1500">1500</option>
                         <option value="2500">2500</option>
                        </select>

                    <div class="order-btn"  >
                        <button type="submit" name='submit'>Proceed to payment</button>
                    </div>
                    
                   <script>
                        function validateForm() {
                            // Get the input fields
                            var email = document.getElementById('email').value;
                            var cardNumber = document.getElementById('cardnumber').value;
                            var expDate = document.getElementById('exp').value;
                            var cvv = document.getElementById('cvv').value;
                            
                            // Email validation regex pattern
                            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                            // Card number and CVV validation
                            var cardNumberPattern = /^\d{16}$/;
                            var cvvPattern = /^\d{3}$/;
                            // Expiry date validation regex pattern
                            var expDatePattern = /^(0[1-9]|1[0-2])\/([0-9]{2})$/;
                            
                            // Check if email matches the pattern
                            if (!emailPattern.test(email)) {
                                alert("Please enter a valid email address.");
                                return false;
                            }
                            
                            // Check if card number is exactly 16 digits
                            if (!cardNumberPattern.test(cardNumber)) {
                                alert("Please enter a valid card number with exactly 16 digits.");
                                return false;
                            }
                            
                            // Check if expiry date matches the pattern and is not in the past
                            if (!expDatePattern.test(expDate)) {
                                alert("Please enter a valid expiry date in MM / YY format.");
                                return false;
                            } else {
                                // Extract month and year from the expiry date
                                var expParts = expDate.split(" / ");
                                var expMonth = parseInt(expParts[0], 10);
                                var expYear = parseInt(expParts[1], 10) + 2000; // Convert YY to YYYY
                                var currentDate = new Date();
                                var currentMonth = currentDate.getMonth() + 1; // Months are zero-based
                                var currentYear = currentDate.getFullYear();
                                
                                // Check if expiry date is in the past
                                if (expYear < currentYear || (expYear === currentYear && expMonth < currentMonth)) {
                                    alert("The expiry date cannot be in the past.");
                                    return false;
                                }
                            }
                            
                            // Check if CVV is exactly 3 digits
                            if (!cvvPattern.test(cvv)) {
                                alert("Please enter a valid CVV with exactly 3 digits.");
                                return false;
                            }
                            
                            return true; // Allow the form to be submitted if all checks pass
                        }
                    </script>
                   

                    
                     </div>
                     </form>
                </div>
            </div>
            
           
            
            
            
       
    </body>
     

</body>
</html>