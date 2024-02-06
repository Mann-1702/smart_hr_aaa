import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/user.dart';

class PointAccumulationPage extends StatefulWidget {
  @override
  _PointAccumulationPageState createState() => _PointAccumulationPageState();

  const PointAccumulationPage({super.key});
}

class _PointAccumulationPageState extends State<PointAccumulationPage> {
  int checkInPoints = 5; // Points for each check-in
  int checkOutPoints = 3; // Points for each check-out
  int overtimePoints = 2; // Points for each overtime hour
  int totalPoints = 0; // Total accumulated points

  // Example method to calculate points based on check-in, check-out, and overtime
  void calculatePoints(int checkInCount, int checkOutCount, int overtimeHours) {
    // Calculate points based on your business rules
    int checkInTotalPoints = checkInCount * checkInPoints;
    int checkOutTotalPoints = checkOutCount * checkOutPoints;
    int overtimeTotalPoints = overtimeHours * overtimePoints;

    // Calculate total points
    totalPoints = checkInTotalPoints + checkOutTotalPoints + overtimeTotalPoints;
  }

  // Example method to fetch check-in and check-out times from Firebase
  Future<void> fetchCheckInOutTimes() async {
    // Replace 'your_firestore_collection' with the actual collection name in your Firestore database
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection(("Employee"))
        .where('id', isEqualTo: User.employeeId)
        .get();

    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection("Employee")
        .doc(snap.docs[0].id)
        .collection("Record")
        .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
        .get();


    // Fetch check-in and check-out times

    QuerySnapshot checkInSnapshot =snap2['checkIn'];
    QuerySnapshot checkOutSnapshot =snap2['checkOut'];

    int checkInCount = checkInSnapshot.size;
    int checkOutCount = checkOutSnapshot.size;

    // Calculate overtime hours based on your business rules
    int overtimeHours = calculateOvertime(checkInSnapshot, checkOutSnapshot);

    // Calculate points
    calculatePoints(checkInCount, checkOutCount, overtimeHours);
  }

  // Example method to calculate overtime hours based on check-in and check-out times
  int calculateOvertime(QuerySnapshot checkInSnapshot, QuerySnapshot checkOutSnapshot) {
    // Implement your logic to calculate overtime hours based on check-in and check-out times
    // For simplicity, assume that overtime is calculated for every hour worked beyond 8 hours
    DateTime eightHoursAgo = DateTime.now().subtract(Duration(hours: 8));

    int overtimeHours = 0;

    for (QueryDocumentSnapshot checkIn in checkInSnapshot.docs) {
      for (QueryDocumentSnapshot checkOut in checkOutSnapshot.docs) {
        if (checkIn['timestamp'].toDate().isBefore(eightHoursAgo) &&
            checkOut['timestamp'].toDate().isAfter(checkIn['timestamp'].toDate())) {
          // Calculate hours between check-in and check-out
          int hoursWorked = checkOut['timestamp'].toDate().difference(checkIn['timestamp'].toDate()).inHours;

          // Update overtime hours
          overtimeHours += (hoursWorked > 8) ? (hoursWorked - 8) : 0;
        }
      }
    }

    return overtimeHours;
  }

  @override
  void initState() {
    super.initState();
    fetchCheckInOutTimes(); // Fetch check-in and check-out times when the widget is initialized
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Point Accumulation',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0), // Adjust the top padding as needed
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                  child: Container(
                    height: 300.0, // Adjust the height as needed
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.white, Colors.white12], // Define your gradient colors
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.yellow,
                        ),
                        Text('125'),
                        Text(
                          'You gained 125 points this month',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

                // Rectangle Box 1
                const SizedBox(height: 16.0), // Add some space before the rectangle box
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust the color of the rectangle box
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0), // Adjust the border radius to make it round
                        child: Image.asset(
                          'assets/images/vecv2.jpg', // Replace with the path to your profile image asset
                          height: 150.0, // Adjust the height of the profile image as needed
                          width: 150.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Performance Points',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          Text(
                            'You get the 15 points ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'for achieving specific',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'goals,meet targets.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //rectangle box2
                const SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust the color of the rectangle box
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0), // Adjust the border radius to make it round
                        child: Image.asset(
                          'assets/images/att3.png', // Replace with the path to your profile image asset
                          height: 150.0, // Adjust the height of the profile image as needed
                          width: 150.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Attendance Points',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          Text(
                            'You get the 35 points ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'for achieving ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'attendance.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Rectangle box 3
                const SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust the color of the rectangle box
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0), // Adjust the border radius to make it round
                        child: Image.asset(
                          'assets/images/pcp.png', // Replace with the path to your profile image asset
                          height: 150.0, // Adjust the height of the profile image as needed
                          width: 150.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Project points',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          Text(
                            'You get the 30 points ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'on the completition',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'of the project.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Rectangle box 4
                SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust the color of the rectangle box
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0), // Adjust the border radius to make it round
                        child: Image.asset(
                          'assets/images/inn1.jpg', // Replace with the path to your profile image asset
                          height: 150.0, // Adjust the height of the profile image as needed
                          width: 150.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Innovation Points',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          Text(
                            'You get the 10 points ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'for contrubuting  ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'innovation ideas.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Rectangle box 5
                SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust the color of the rectangle box
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0), // Adjust the border radius to make it round
                        child: Image.asset(
                          'assets/images/td1.png', // Replace with the path to your profile image asset
                          height: 150.0, // Adjust the height of the profile image as needed
                          width: 150.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Training Points',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          Text(
                            'You get the 20 points ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'for training  ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'and development.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Rectangle box 6
                SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust the color of the rectangle box
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0), // Adjust the border radius to make it round
                        child: Image.asset(
                          'assets/images/eca.jpg', // Replace with the path to your profile image asset
                          height: 150.0, // Adjust the height of the profile image as needed
                          width: 150.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Extra Circuilar',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          SizedBox(height: 1.0),
                          Text(
                            'Points',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          Text(
                            'You get the 20 points ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
                            ),
                          ),
                          SizedBox(height: 1.0), // Add some space between the text and the top of the container
                          Text(
                            'for activites ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "NexaRegular", // Adjust the font family as needed
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
        ),
      ),
    );
  }
}