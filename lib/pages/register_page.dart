import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_button.dart';
import 'package:tasktrail/components/my_textfeild.dart';
import 'package:tasktrail/services/auth/auth_service.dart';
import 'package:tasktrail/services/firrestore.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegiterState();
}

class _RegiterState extends State<RegisterPage> {
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confimPasswordController =
      TextEditingController();

  bool isLoading = false;
  var rng = Random();

  void register() async {
    setState(() {
      isLoading = true;
    });
    //get the auth service
    await Future.delayed(const Duration(seconds: 2));

    final _authService = AuthService();

    if (passwordController.text == confimPasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );

        var randomNumber = rng.nextInt(10000);
        await firestoreService.addUser(
            emailController.text, "User " + randomNumber.toString());

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Account created successfully!'),
              ),
            ),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords dont't match!"),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logos
                    //hey
                    Icon(
                      Icons.travel_explore,
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
                      controller: confimPasswordController,
                      hintText: 'confirm password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),

                    //sing in button
                    MyButton(text: 'Sign Up', onTap: register),
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
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
