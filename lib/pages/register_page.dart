import 'dart:math';

import 'package:flutter/material.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confimPasswordController =
      TextEditingController();

  final FirestoreService firestoreService = FirestoreService();

  bool isLoading = false;

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
        var rng = Random();
        var randomNumber = rng.nextInt(10000000);
        var imageRandom = rng.nextInt(6) + 1;

        await firestoreService.addUser(
            emailController.text, "User-$randomNumber", imageRandom);
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/loginScreen.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 300),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35, right: 35),
                            child: Column(
                              children: [
                                const SizedBox(height: 25),
                                MyTextFeild(
                                  controller: emailController,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),
                                const SizedBox(height: 30),
                                MyTextFeild(
                                  controller: passwordController,
                                  hintText: 'Password',
                                  obscureText: true,
                                ),
                                const SizedBox(height: 30),
                                MyTextFeild(
                                  controller: confimPasswordController,
                                  hintText: 'Confirm Password',
                                  obscureText: true,
                                ),
                                const SizedBox(height: 40),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 9, left: 9),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Sign in',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(127, 110, 157, 1),
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: const Color.fromRGBO(
                                            160, 147, 183, 1),
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: register,
                                          icon: const Icon(
                                            Icons.arrow_forward,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'already have an account?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(160, 147, 183, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    GestureDetector(
                                      onTap: widget.onTap,
                                      child: const Text(
                                        'Login now',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(160, 147, 183, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
