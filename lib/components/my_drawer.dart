// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_drawer_tile.dart';
import 'package:tasktrail/pages/settings_page.dart';
import 'package:tasktrail/services/auth/auth_service.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  bool isLoading = false;

  void logout () async {

    setState(() {
      isLoading = true;
    });

    final _authService = AuthService();

    await Future.delayed(const Duration(seconds: 2));
    _authService.signOut();

     setState(() {
      isLoading = false;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: isLoading
      ? const Center(child:CircularProgressIndicator())
        :Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Icon(
                Icons.lock_open_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            //app logo
            MyDrawerTile(
              text: 'H O M E',
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),
        
            //home list tile
            MyDrawerTile(
              text: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
        
            const Spacer(),
        
            //settings list tile
            MyDrawerTile(
              text: 'L O G O U T',
              icon: Icons.logout,
              onTap: logout,
            ),
        
            const SizedBox(height: 30),
        
            //logout list tile
          ],
        ),
      );
  }
}
