import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_hr_aaa/admintodayscreen.dart';

import 'PointAccumulationPage.dart';
import 'RedemOptionpage.dart';
import 'ReferralBonusespage.dart';
import 'RegistrationPage.dart';
import 'adminpointaccumulation.dart';
import 'homescreen.dart';
import 'model/user.dart';

class AdminRewards extends StatefulWidget {
  const AdminRewards({super.key});

  @override
  State<AdminRewards> createState() => _AdminRewardsState();
}

class _AdminRewardsState extends State<AdminRewards> {

  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reward Settings',
          style: TextStyle(
            fontFamily: 'NexaRegular',
            color: Colors.white,
          ),
        ),
        backgroundColor: primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffeef444c),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      color: Colors.black26,
                      size: 55,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hello, Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NexaBold',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 17,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AdminTodayScreen()));
                // Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              title: Text(
                'Reward Settings',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 17,
                  color: primary,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const ListTile(
              title: Text(
                'Training & Development',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 17,
                ),
              ),
              // onTap: () {
              //   // Navigator.pop(context);
              // },
            ),
            ListTile(
              title: Text(
                'Register new Employee',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 17,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  RegistrationPage()));
              },

            ),
            Container(
              margin: const EdgeInsets.only(top: 280),
            ),
            const Divider(),
            const ListTile(
              title: Text(
                'Copyright © 2024 TechnoGuide Infosoft',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/myrwd.jpg', // Replace with your image path
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 70),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle the button press for Container 1
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminPointAccumulation(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary, // Background color
                          foregroundColor: Colors.white, // Text color
                          elevation: 5, // Elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20), // Padding
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow), // Icon
                            SizedBox(width: 8),
                            Text(
                              'Point Accumulation Settings',
                              style: TextStyle(fontSize: 16, fontFamily: 'NexaRegular'),
                            ),
                          ],
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
    );
  }
}
