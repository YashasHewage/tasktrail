import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_button.dart';
import 'package:tasktrail/components/my_textfeild.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key ,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegiterState();
}

class _RegiterState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
    final TextEditingController confimPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
        
            //message, app slogon
            Text(
              'Create Acount',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),
        
            //email
            MyTextFeild(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
        
            const SizedBox(height: 25),
        
            //password
            MyTextFeild(
              controller: passwordController,
              hintText: 'password',
              obscureText: true,
            ),
            const SizedBox(height: 25),
        
            MyTextFeild(
              controller: passwordController,
              hintText: 'confirm password',
              obscureText: true,
            ),
            const SizedBox(height: 25),
        
            //sing in button
            MyButton(text: 'Sign Up', onTap: () {}),
            const SizedBox(height: 25),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
