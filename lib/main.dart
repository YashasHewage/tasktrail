import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktrail/auth/login_or_register.dart';
import 'package:tasktrail/themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister (),
      theme: Provider.of<ThemeProvider>(context).themeData,

    );
  }
}