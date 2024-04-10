import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key, required String id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Text(
              'Advertisement View',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 19, 19, 19),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Theme.of(context).colorScheme.tertiary,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need a Maths Teacher',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 163, 163, 163),
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 25, bottom: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: const Color(0xFFDBE3FF),
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/briefcase.png'),
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Category',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF777B8A),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Education',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF121212),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: const Color(0xFFDBFFEC),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/salary.png'),
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Position',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF777B8A),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        '\$100',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF121212),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: const Color(0xFFFFDBDB),
                                      child: Container(
                                        width: 30,
                                        height: 25,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/slots.png'),
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Position',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF777B8A),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        '10',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF121212),
                                          fontSize: 18,
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
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Requirements',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'In the heart of a bustling metropolis, the neon lights danced upon the wet pavement as the city embraced the night. Amongst the crowd, whispers of ambition mingled with the scent of coffee and distant laughter. Each step taken echoed stories untold, weaving a tapestry of urban dreams in the midnight air.',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 150),
        width: 320,
        child: FloatingActionButton(
          onPressed: () {},
          child: Text(
            'Enroll Now',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 67, 98, 235),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
