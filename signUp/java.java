import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/signup")
public class SignUpController {

    @PostMapping
    public ResponseEntity<String> signUp(@RequestParam String username,
                                          @RequestParam String email,
                                          @RequestParam String password,
                                          @RequestParam String confirmPassword) {
        // Validate inputs and create a new user
        // (add your logic here, like checking if the username or email is taken)
        
        return ResponseEntity.ok("User registered successfully!");
    }
}
