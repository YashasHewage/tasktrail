import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_button.dart';
import 'package:tasktrail/components/my_textfeild.dart';
import 'package:tasktrail/services/auth/auth_service.dart';
import 'package:tasktrail/services/firrestore.dart';

class Loginpage extends StatefulWidget {
  final void Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

final FirestoreService firestoreService = FirestoreService();

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  //login method
  void login() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    //get instance of auth service
    final _authService = AuthService();

    try {
      await _authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);

      await firestoreService.addUser(emailController.text, "User213123");

      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Login Successful'),
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
                      //logo
                      Icon(
                        Icons.travel_explore,
                        size: 100,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      const SizedBox(height: 25),

                      //message, app slogon
                      Text(
                        'Task Trail',
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

                      //sing in button
                      MyButton(text: 'Sign In', onTap: login),
                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member ?',
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'register now',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )

                      // not a member? register now
                    ],
                  ),
                ),
        ));
  }
}
