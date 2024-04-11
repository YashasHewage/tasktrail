import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: IconButton(
                  //     icon: const Icon(Icons.arrow_back),
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // const SizedBox(height: 10),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 1, bottom: 10),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Categories',
                  //         style: TextStyle(
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _buildCategoryButton('Engineering', context,
                                addIcon: true, icon: Icons.lightbulb_outline),
                            const SizedBox(height: 10),
                            _buildCategoryButton('IT', context,
                                addIcon: true, icon: Icons.laptop),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Healthcare', context,
                                addIcon: true, icon: Icons.health_and_safety),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Science', context,
                                addIcon: true, icon: Icons.science),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Entertainment', context,
                                addIcon: true, icon: Icons.music_video),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Gardening ', context,
                                addIcon: true, icon: Icons.eco),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Volunteer ', context,
                                addIcon: true, icon: Icons.handshake),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Household Chores ', context,
                                addIcon: true, icon: Icons.home_work_rounded),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Beauty & Skincare ', context,
                                addIcon: true, icon: Icons.face),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            _buildCategoryButton('Education', context,
                                addIcon: true, icon: Icons.school),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Construction', context,
                                addIcon: true, icon: Icons.construction),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Transportation', context,
                                addIcon: true, icon: Icons.local_shipping),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Finance', context,
                                addIcon: true, icon: Icons.attach_money),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Sports', context,
                                addIcon: true, icon: Icons.sports_cricket),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Photography', context,
                                addIcon: true, icon: Icons.camera_alt),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Therapy', context,
                                addIcon: true, icon: Icons.self_improvement),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Parenting', context,
                                addIcon: true, icon: Icons.family_restroom),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Events & Activities', context,
                                addIcon: true, icon: Icons.event),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String categoryName, BuildContext context,
      {bool addIcon = false, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(180, 68),
          backgroundColor: Color.fromARGB(255, 241, 241, 241),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (addIcon && icon != null) Icon(icon, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
