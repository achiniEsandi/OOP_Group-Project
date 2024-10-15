package Payment.Model;

public class User {
	
	private int id;
    private String cardholdername;
    private String email;
    private String cardnumber;
    private String expiredate;
    private String CVVcode;
    private String amount;
    
	public User(int id, String cardholdername, String email, String cardnumber, String expiredate, String CVVcode,String amount) {
	
		this.id = id;
		this.cardholdername = cardholdername;
		this.email = email;
		this.cardnumber = cardnumber;
		this.expiredate = expiredate;
		this.CVVcode = CVVcode;
		this.amount = amount;
	}

	public int getId() {
		return id;
	}

	public String getCardholdername() {
		return cardholdername;
	}

	public String getEmail() {
		return email;
	}

	public String getCardnumber() {
		return cardnumber;
	}

	public String getExpiredate() {
		return expiredate;
	}

	public String getCVVcode() {
		return CVVcode;
	}

	public String getAmount() {
		return amount;
	}

    
    

    
    
    

}
