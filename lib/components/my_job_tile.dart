import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasktrail/pages/job_detail.dart';

class JobCard extends StatelessWidget {
  final String jobTitle;
  final String price;
  final String availableSlots;
  final String address;
  final String jobType;
  final String documentId;

  const JobCard({
    Key? key,
    required this.jobTitle,
    required this.price,
    required this.availableSlots,
    required this.address,
    required this.jobType,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Container(
        width: 365,
        height: 133,
        child: Stack(
          children: [
            Positioned(
              left: 5,
              top: 0,
              child: Center(
                child: Container(
                  width: 365,
                  height: 133,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 17,
              child: SizedBox(
                width: 203,
                height: 31,
                child: Text(
                  '$jobTitle',
                  style: TextStyle(
                    color: Color(0xFF090F24),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 51,
              child: SizedBox(
                width: 150,
                height: 14,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                    ),
                    Text(
                      '$address',
                      style: const TextStyle(
                        color: Color(0xFF868686),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 22,
              top: 79,
              child: Container(
                width: 68,
                height: 25,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 68,
                        height: 25,
                        decoration: ShapeDecoration(
                          color: const Color(0xE8406AFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '$jobType',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 269,
              top: 83,
              child: SizedBox(
                width: 71,
                height: 27,
                child: Text(
                  'Rs$price',
                  style: TextStyle(
                    color: Color(0xFF434F76),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
