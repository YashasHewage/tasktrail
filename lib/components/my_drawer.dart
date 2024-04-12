import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_drawer_tile.dart';
import 'package:tasktrail/pages/add_job.dart';
import 'package:tasktrail/pages/categoriesview.dart';
import 'package:tasktrail/pages/my_ads.dart';
import 'package:tasktrail/pages/settings_page.dart';
import 'package:tasktrail/services/auth/auth_service.dart';
import 'package:tasktrail/services/firrestore.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  bool isLoading = false;

  void logout() async {
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

  final FirestoreService firestoreService = FirestoreService();

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                FutureBuilder<int>(
                  future: firestoreService
                      .getUserImageNumberByEmail(authService.getEmail()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return const Text('Error fetching imagenumber');
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Image.asset(
                        'assets/images/avatar${snapshot.data}.png',
                        height: 120,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    authService.getEmail(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Divider(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                //app logo
                MyDrawerTile(
                  text: 'Home',
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
                ),
                MyDrawerTile(
                  text: 'Categories',
                  icon: Icons.category,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesPage(),
                      ),
                    );
                  },
                ),

                //home list tile
                // MyDrawerTile(
                //   text: 'Settings',
                //   icon: Icons.settings,
                //   onTap: () {
                //     Navigator.pop(context);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProfileView(),
                //       ),
                //     );
                //   },
                // ),

                MyDrawerTile(
                  text: 'Publish Task',
                  icon: Icons.add_to_photos_rounded,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddJob(),
                      ),
                    );
                  },
                ),
                MyDrawerTile(
                  text: 'Task Management',
                  icon: Icons.task,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAds(),
                      ),
                    );
                  },
                ),

                MyDrawerTile(
                  text: 'Settings',
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileView(),
                      ),
                    );
                  },
                ),

                // MyDrawerTile(
                //   text: 'Fetch Data',
                //   icon: Icons.add_to_photos_rounded,
                //   onTap: () {
                //     Navigator.pop(context);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => CategoriesPage(),
                //       ),
                //     );
                //   },
                // ),

                const Spacer(),

                //settings list tile
                MyDrawerTile(
                  text: 'Logout',
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
