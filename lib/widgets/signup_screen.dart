import 'package:flutter/material.dart';
import '../main.dart'; //

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();


    final List<Map<String, String>> registeredUsers = [];

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/signup.png'),
              height: 100,
            ),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 10),

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
                final name = nameController.text.trim();
                final login = loginController.text.trim();
                final password = passwordController.text.trim();

                if (name.isEmpty || login.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) => const AlertDialog(
                      title: Text('Error'),
                      content: Text("Please fill in all fields"),
                    ),
                  );
                  return;
                }


                registeredUsers.add({
                  'name': name,
                  'login': login,
                  'password': password,
                });

                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Success'),
                    content: Text("User $name registered successfully!"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );


                nameController.clear();
                loginController.clear();
                passwordController.clear();
              },
              child: const Text("Register"),
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
