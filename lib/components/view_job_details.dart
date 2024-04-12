import 'package:flutter/material.dart';

class ViewJobDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
              const Positioned(
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
      ],
    );
  }
}
