import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasktrail/services/auth/auth_service.dart';

class Loginpage extends StatefulWidget {
  final void Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

bool _obscureText = true;

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
                                SizedBox(
                                  height: 30,
                                ),
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

                                // MyTextFeild(
                                //   controller: emailController,
                                //   hintText: 'Email',
                                //   obscureText: false,
                                // ),
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
                                // MyTextFeild(
                                //   controller: passwordController,
                                //   hintText: 'Password',
                                //   obscureText: true,
                                // ),
                                const SizedBox(height: 40),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(right: 9, left: 9),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Sign in',
                                //         style: GoogleFonts.poppins(
                                //           color: Color.fromRGBO(127, 110, 157, 1),
                                //           fontSize: 28,
                                //           fontWeight: FontWeight.w500,
                                //         ),
                                //       ),
                                //       CircleAvatar(
                                //         radius: 28,
                                //         backgroundColor:
                                //             Color.fromRGBO(160, 147, 183, 1),
                                //         child: IconButton(
                                //           color: Colors.white,
                                //           onPressed: login,
                                //           icon: const Icon(
                                //             Icons.arrow_forward,
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextButton(
                                  onPressed: login,
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text(
                                      'Sign In',
                                      style: GoogleFonts.poppins(
                                      color:
                                        Color.fromRGBO(127, 110, 157, 1),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 23,
                                      backgroundColor:
                                        Color.fromRGBO(160, 147, 183, 1),
                                      child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      ),
                                    ),
                                    ],
                                  ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: GoogleFonts.poppins(
                                        color: Color.fromRGBO(127, 110, 157, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: widget.onTap,
                                      child: Text(
                                        'register',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Color(0xFF8F86FA),
                                          fontWeight: FontWeight.w500,
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
