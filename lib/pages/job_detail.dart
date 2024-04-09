import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key, required String id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task View'),
        backgroundColor: Color(0xFF406AFF),
      ),
      body: Column(
        children: [
          Container(
            width: 393,
            height: 845,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 161,
                  top: 555,
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 59,
                  top: 619,
                  child: Container(
                    width: 275,
                    height: 45,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 275,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: Color(0xFF406AFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105,
                          top: 13,
                          child: Text(
                            'Enroll Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 60,
                  top: 76,
                  child: Text(
                    'Advertisement View',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 125,
                  child: Container(
                    width: 376,
                    height: 567,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 365,
                            height: 567,
                            decoration: ShapeDecoration(
                              color: Color(0xFFEBEBEB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 58,
                          top: 32,
                          child: Text(
                            'Need a Maths Teacher',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 119,
                          child: Text(
                            'Rs. 100,000',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 183,
                          child: Text(
                            '333/B, Bunwala Road, Ja-ela',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 228,
                          child: Text(
                            'Job Description :',
                            style: TextStyle(
                              color: Color(0xFF928FFF),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 96,
                          child: Text(
                            'Salary :',
                            style: TextStyle(
                              color: Color(0xFF928FFF),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 430,
                          child: Text(
                            'Available Slots :',
                            style: TextStyle(
                              color: Color(0xFF928FFF),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 160,
                          child: Text(
                            'Location :',
                            style: TextStyle(
                              color: Color(0xFF928FFF),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 251,
                          child: SizedBox(
                            width: 365,
                            child: Text(
                              'In the heart of a bustling metropolis, the neon lights danced upon the wet pavement as the city embraced the night. Amongst the crowd, whispers of ambition mingled with the scent of coffee and distant laughter. Each step taken echoed stories untold, weaving a tapestry of urban dreams in the midnight air.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 96,
                          top: 119,
                          child: Text(
                            '(Fixed Rate)',
                            style: TextStyle(
                              color: Color(0xFF6C6C6C),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 453,
                          child: Text(
                            '( 0 Enrolled )',
                            style: TextStyle(
                              color: Color(0xFF6C6C6C),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 714,
                  child: Container(
                    width: 365,
                    height: 109,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 365,
                            height: 109,
                            decoration: ShapeDecoration(
                              color: Color(0xFFEBEBEB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 12,
                          child: Text(
                            'About the Advertiser',
                            style: TextStyle(
                              color: Color(0xFF928FFF),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 83,
                          top: 46,
                          child: Text(
                            'Yashas Hewage',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 84,
                          top: 69,
                          child: Text(
                            '23. 06. 2020   06.30 pm',
                            style: TextStyle(
                              color: Color(0xFF4F4F4F),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 41,
                          child: Container(
                            width: 53,
                            height: 51,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/53x51"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black
                                      .withOpacity(0.30000001192092896),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 255,
                          top: 46,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Color(0xFF928FFF),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 310,
                          top: 46,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Color(0xFF928FFF),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 319,
                          top: 55,
                          child: Container(
                            width: 21,
                            height: 21,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 1.75, vertical: 3.50),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 264,
                          top: 56,
                          child: Container(
                            height: 21,
                            padding: const EdgeInsets.only(
                              top: 2,
                              left: 4,
                              right: 1.25,
                              bottom: 3.25,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
