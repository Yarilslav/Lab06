import 'package:flutter/material.dart';
import './signup_screen.dart';
import '../main.dart'; //

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/reset.png'),
              height: 100,
            ),

            TextField(
              controller: loginController,
              decoration: const InputDecoration(
                labelText: "Login or email",
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final login = loginController.text.trim();

                if (login.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AlertDialog(
                      title: Text('Error'),
                      content: Text("Please enter your login or email"),
                    ),
                  );
                  return;
                }

                final user = registeredUsers.firstWhere(
                      (u) => u['login'] == login,
                  orElse: () => {},
                );

                if (user.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Success'),
                      content: Text("Password for ${user['name']} has been reset (mock)"),
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
                      content: Text("User not found"),
                    ),
                  );
                }

                loginController.clear();
              },
              child: const Text("Reset"),
            ),

            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
