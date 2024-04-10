import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              const Positioned(
                left: 61,
                top: 79,
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 28,
                top: 331,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 130,
                child: Container(
                  width: 338,
                  height: 146,
                  decoration: ShapeDecoration(
                    color: const Color(0x33928FFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 150,
                top: 183,
                child: Text(
                  'Guest_user_1000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 150,
                top: 208,
                child: Text(
                  'guestuser1000@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 316,
                top: 139,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF928FFF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 320,
                top: 143,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.only(
                    top: 4.91,
                    left: 4.50,
                    right: 4.91,
                    bottom: 4.50,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 163,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/80x80"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 372,
                child: Container(
                  width: 338,
                  height: 75,
                  decoration: ShapeDecoration(
                    color: const Color(0x33928FFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 281,
                top: 392,
                child: Container(
                  width: 60,
                  height: 34,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFBBBBBB)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 288,
                top: 398,
                child: Container(
                  width: 23,
                  height: 23,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF515151),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              const Positioned(
                left: 53,
                top: 396,
                child: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 161,
                top: 758,
                child: Text(
                  'TaskTrail co.',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 141,
                top: 776,
                child: SizedBox(
                  width: 112,
                  height: 18,
                  child: Text(
                    'All Rights Recieved',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 161,
                top: 740,
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
