import 'package:flutter/material.dart';
import 'forget_password_screen.dart';
import 'sign_up_screen.dart';
import 'HomeScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isNotEmpty && password.length >= 6) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid credentials")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? Colors.white70 : Colors.black87;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              const SizedBox(height: 32),
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Please provide us with your information in order to login your account",
                style: TextStyle(fontSize: 14, color: subtitleColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              Text("Email Address", style: TextStyle(fontWeight: FontWeight.w500, color: textColor)),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Password", style: TextStyle(fontWeight: FontWeight.w500, color: textColor)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()),
                      );
                    },
                    child: const Text("Forget Password?", style: TextStyle(color: Colors.deepPurple)),
                  ),
                ],
              ),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password Here",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("SIGN IN", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),

              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t you have an account?", style: TextStyle(color: subtitleColor)),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or Continue With"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 24),

              // Facebook button
              InkWell(
                onTap: () {
                  // TODO: Handle Facebook sign-in
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1877F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.white),
                        SizedBox(width: 10),
                        Text("Sign In with Facebook", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Google button
              InkWell(
                onTap: () {
                  // TODO: Handle Google sign-in
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: isDark ? Colors.white : Colors.black, width: 1.2),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google.png', height: 24, width: 24),
                        const SizedBox(width: 10),
                        Text(
                          "Sign In with Google",
                          style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
