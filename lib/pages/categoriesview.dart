import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 1, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _buildCategoryButton('Engineering', context,
                                addIcon: true, icon: Icons.lightbulb_outline),
                            const SizedBox(height: 10),
                            _buildCategoryButton(
                                'Information Technology', context,
                                addIcon: true, icon: Icons.laptop),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Healthcare', context,
                                addIcon: true, icon: Icons.add),
                            const SizedBox(height: 10),
                            _buildCategoryButton(
                                'Science and Technology', context,
                                addIcon: true, icon: Icons.science),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Engineering', context,
                                addIcon: true, icon: Icons.lightbulb_outline),
                            const SizedBox(height: 10),
                            _buildCategoryButton(
                                'Information Technology', context,
                                addIcon: true, icon: Icons.laptop),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Healthcare', context,
                                addIcon: true, icon: Icons.add),
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
                            _buildCategoryButton('Education', context,
                                addIcon: true, icon: Icons.school),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Construction', context,
                                addIcon: true, icon: Icons.construction),
                            const SizedBox(height: 10),
                            _buildCategoryButton('Transportation', context,
                                addIcon: true, icon: Icons.local_shipping),
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
