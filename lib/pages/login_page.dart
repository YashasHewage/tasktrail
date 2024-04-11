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
                                // const Text(
                                //   '',
                                //   style: TextStyle(
                                //     color: Color.fromRGBO(127, 110, 157, 1),
                                //     fontSize: 27,
                                //     fontWeight: FontWeight.w700,
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
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
                                        backgroundColor:
                                            Color.fromRGBO(160, 147, 183, 1),
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: login,
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
                                      child: Text(
                                        'register',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
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
