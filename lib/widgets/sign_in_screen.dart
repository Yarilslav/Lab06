import 'package:flutter/material.dart';
import './signup_screen.dart';
import './reset_password_screen.dart';
import '../main.dart'; //



class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/login.png'),
              height: 100,
            ),

            TextField(
              controller: loginController,
              decoration: const InputDecoration(
                labelText: "Login",
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final login = loginController.text.trim();
                final password = passwordController.text.trim();

                if (login.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AlertDialog(
                      title: Text('Error'),
                      content: Text("Please fill in all fields"),
                    ),
                  );
                  return;
                }


                final user = registeredUsers.firstWhere(
                      (u) => u['login'] == login && u['password'] == password,
                  orElse: () => {},
                );

                if (user.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Success'),
                      content: Text("Welcome, ${user['name']}!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AlertDialog(
                      title: Text('Error'),
                      content: Text("Invalid login or password"),
                    ),
                  );
                }
              },
              child: const Text("Login"),
            ),

            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
              child: const Text("Sign up"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordScreen(),
                  ),
                );
              },
              child: const Text("Forgot password?"),
            ),
          ],
        ),
      ),
    );
  }
}
