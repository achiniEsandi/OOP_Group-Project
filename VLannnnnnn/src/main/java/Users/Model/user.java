package Users.Model;

public class user {
    private int id;
    private String name;
    private String lastName;
    private int age;
    private String gender;
    private String phone;
    private String email;
    private String address;
    private String firstName;
    private String password;

    
    public user() {
    	  this.id = 0;
          this.name = "";
          this.lastName = "";
          this.age = 0;
          this.gender = "";
          this.phone = "";
          this.email = "";
          this.address = "";
          this.firstName = "";
          this.password = "";
	}

    // Constructor
    public user(int id, String firstName, String lastName, int age, String gender, 
                String phone, String email, String address, String username, String password) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.name = username;
        this.password = password;
    }
    
    public user(int id, String name, String email, String pwd) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = pwd;
    }
    
    public user(String email, String pwd) {
		this.email = email;
		this.password = pwd;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getfirstName() { return firstName; }
    public void setfirstName(String firstName) { this.firstName = firstName; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
