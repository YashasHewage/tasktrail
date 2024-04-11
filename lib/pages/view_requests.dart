import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewReq extends StatelessWidget {
  const ViewReq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Text(
                'View Requests',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 19, 19, 19),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  decoration: BoxDecoration(
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/avatar4.png'),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'username',
                                    overflow: TextOverflow.visible,
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(255, 27, 27, 27),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Email',
                                    overflow: TextOverflow.visible,
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(255, 150, 150, 150),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Color.fromARGB(255, 255, 56, 56),
                        child: Icon(Icons.close, size: 22 , color: Colors.white,),
                      ),
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Color.fromARGB(255, 20, 199, 0),
                        child: Icon(Icons.check, size: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}