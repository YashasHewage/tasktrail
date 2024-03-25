import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasktrail/components/my_button.dart';
import 'package:tasktrail/components/my_textfeild.dart';
import 'package:tasktrail/pages/home_page.dart';

class Loginpage extends StatefulWidget {
  final void Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() {
    /*


    fill out authentcation here....



    */

    //navigate to the home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
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
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'register now',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )

              // not a member? register now
            ],
          ),
        ));
  }
}
