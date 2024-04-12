import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasktrail/services/auth/auth_service.dart';
import 'package:tasktrail/services/firrestore.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegiterState();
}
bool _obscureText = true;


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
                               Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                      height: 60,
                                      child: TextFormField(
                                        controller: emailController,
                                        obscureText: false,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(127, 110, 157, 1),
                                        ),
                                        decoration: InputDecoration(
                                          fillColor:
                                              Color.fromARGB(0, 245, 245, 245),
                                          filled: true,
                                          labelText: 'Email',
                                          labelStyle: GoogleFonts.poppins(
                                            color: Color.fromRGBO(
                                                127, 110, 157, 1),
                                          ),
                                          hintText: 'Enter an email address',
                                          hintStyle: GoogleFonts.poppins(),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Container(
                                      height: 60,
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: _obscureText,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                127, 110, 157, 1)),
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: GoogleFonts.poppins(
                                              color: Color.fromRGBO(
                                                  127, 110, 157, 1)),
                                          hintText: 'Enter a password',
                                          hintStyle: GoogleFonts.poppins(),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Color.fromRGBO(
                                                  127, 110, 157, 1),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Container(
                                      height: 60,
                                      child: TextFormField(
                                        controller:confimPasswordController,
                                        obscureText: _obscureText,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                127, 110, 157, 1)),
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: GoogleFonts.poppins(
                                              color: Color.fromRGBO(
                                                  127, 110, 157, 1)),
                                          hintText: 'Enter a password',
                                          hintStyle: GoogleFonts.poppins(),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Color.fromRGBO(
                                                  127, 110, 157, 1),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height:30),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Register',
                                        style: GoogleFonts.poppins(
                                          color: Color.fromRGBO(127, 110, 157, 1),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 22,
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
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(160, 147, 183, 1),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: widget.onTap,
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 14,
                                           color: Color(0xFF8F86FA),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: GoogleFonts.poppins().fontFamily,
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
