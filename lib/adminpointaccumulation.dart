import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/user.dart';

class AdminPointAccumulation extends StatefulWidget {
  const AdminPointAccumulation({super.key});

  @override
  State<AdminPointAccumulation> createState() => _AdminPointAccumulationState();
}

class _AdminPointAccumulationState extends State<AdminPointAccumulation> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  final TextEditingController performancePointsController = TextEditingController();
  final TextEditingController attendancePointsController = TextEditingController();
  final TextEditingController projectPointsController = TextEditingController();
  final TextEditingController innovationPointsController = TextEditingController();
  final TextEditingController trainingPointsController = TextEditingController();
  final TextEditingController extraCurricularPointsController = TextEditingController();

  @override
  void dispose() {
    performancePointsController.dispose();
    attendancePointsController.dispose();
    projectPointsController.dispose();
    innovationPointsController.dispose();
    trainingPointsController.dispose();
    extraCurricularPointsController.dispose();
    super.dispose();
  }

  // Function to save data to Firestore
  void saveData() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection("Employee")
        .where('id', isEqualTo: User.employeeId)
        .get();
    try {
      await FirebaseFirestore.instance
          .collection("Employee")
          .doc(snap.docs[0].id)
          .collection("Record")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .set({
        'performancePoints': performancePointsController.text,
        'attendancePoints': attendancePointsController.text,
        'projectPoints': projectPointsController.text,
        'innovationPoints': innovationPointsController.text,
        'trainingPoints': trainingPointsController.text,
        'extraCurricularPoints': extraCurricularPointsController.text,

      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully')),
      );
    } catch (e) {
      print('Error saving data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error saving data')),
      );
    }
  }

  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Points Settings',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NexaBold',
          ),),
        backgroundColor: primary,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this color to your desired color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0), // Adjust the top padding as needed
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [

                // Rectangle Box 1
                const SizedBox(height: 16.0), // Add some space before the rectangle box
                Container(
                  height: 100.0,width: 400,// Adjust the height as needed
                  margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Adjust the color of the rectangle box
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    boxShadow:  [
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
                          'assets/images/vecv2.jpg', // Replace with the path to your profile image asset
                          height: 100.0, // Adjust the height of the profile image as needed
                          width: 100.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set Performance Points:',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          const SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          SizedBox(
                            height: 40,
                            width: 200.0, // Set the width of the TextField
                            child: TextField(
                              keyboardType: TextInputType.number, // Allow only numbers
                              cursorColor: Colors.red, // Change the color of the cursor
                              decoration: InputDecoration(
                                hintText: 'Enter points',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NexaRegular',
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue), // Change the color of the border
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder( // Change the border color when the field is focused
                                  borderSide: BorderSide(color: primary), // Change the color of the focused border
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                              // Add your logic to handle the entered points
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
                  height: 100.0,width: 400,// Adjust the height as needed
                  margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: const EdgeInsets.all(12.0),
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
                          'assets/images/att3.png', // Replace with the path to your profile image asset
                          height: 100.0, // Adjust the height of the profile image as needed
                          width: 100.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set Attendance Points:',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          const SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          SizedBox(
                            height: 40,
                            width: 200.0, // Set the width of the TextField
                            child: TextField(
                              keyboardType: TextInputType.number, // Allow only numbers
                              cursorColor: Colors.red, // Change the color of the cursor
                              decoration: InputDecoration(
                                hintText: 'Enter points',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NexaRegular',
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue), // Change the color of the border
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder( // Change the border color when the field is focused
                                  borderSide: BorderSide(color: primary), // Change the color of the focused border
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                              // Add your logic to handle the entered points
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
                  height: 100.0,width: 400,// Adjust the height as needed
                  margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: const EdgeInsets.all(12.0),
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
                          height: 100.0, // Adjust the height of the profile image as needed
                          width: 100.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set Project Points:',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          const SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          SizedBox(
                            height: 40,
                            width: 200.0, // Set the width of the TextField
                            child: TextField(
                              keyboardType: TextInputType.number, // Allow only numbers
                              cursorColor: Colors.red, // Change the color of the cursor
                              decoration: InputDecoration(
                                hintText: 'Enter points',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NexaRegular',
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue), // Change the color of the border
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder( // Change the border color when the field is focused
                                  borderSide: BorderSide(color: primary), // Change the color of the focused border
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                              // Add your logic to handle the entered points
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Rectangle box 4
                const SizedBox(height: 8.0),
                Container(
                  height: 100.0,width: 400,// Adjust the height as needed
                  margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: const EdgeInsets.all(12.0),
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
                          'assets/images/inn1.jpg', // Replace with the path to your profile image asset
                          height: 100.0, // Adjust the height of the profile image as needed
                          width: 100.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set Innovation Points:',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          const SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          SizedBox(
                            height: 40,
                            width: 200.0, // Set the width of the TextField
                            child: TextField(
                              keyboardType: TextInputType.number, // Allow only numbers
                              cursorColor: Colors.red, // Change the color of the cursor
                              decoration: InputDecoration(
                                hintText: 'Enter points',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NexaRegular',
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue), // Change the color of the border
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder( // Change the border color when the field is focused
                                  borderSide: BorderSide(color: primary), // Change the color of the focused border
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                              // Add your logic to handle the entered points
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Rectangle box 5
                const SizedBox(height: 8.0),
                Container(
                  height: 100.0,width: 400,// Adjust the height as needed
                  margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: const EdgeInsets.all(12.0),
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
                          'assets/images/td1.png', // Replace with the path to your profile image asset
                          height: 100.0, // Adjust the height of the profile image as needed
                          width: 100.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set Training Points:',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          const SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          SizedBox(
                            height: 40,
                            width: 200.0, // Set the width of the TextField
                            child: TextField(
                              keyboardType: TextInputType.number, // Allow only numbers
                              cursorColor: Colors.red, // Change the color of the cursor
                              decoration: InputDecoration(
                                hintText: 'Enter points',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NexaRegular',
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue), // Change the color of the border
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder( // Change the border color when the field is focused
                                  borderSide: BorderSide(color: primary), // Change the color of the focused border
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                              // Add your logic to handle the entered points
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Rectangle box 6
                const SizedBox(height: 8.0),
                Container(
                  height: 100.0,width: 400,// Adjust the height as needed
                  margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the margin as needed
                  padding: const EdgeInsets.all(12.0),
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
                          'assets/images/eca.jpg', // Replace with the path to your profile image asset
                          height: 100.0, // Adjust the height of the profile image as needed
                          width: 100.0, // Adjust the width of the profile image as needed
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(height: 8.0), // Add some space between the image and text
                      // Text
                      // Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Extra Curricular Points:',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "NexaBold",
                            ),
                          ),
                          const SizedBox(height: 8.0), // Add some space between the text and the top of the container
                          SizedBox(
                            height: 40,
                            width: 200.0, // Set the width of the TextField
                            child: TextField(
                              keyboardType: TextInputType.number, // Allow only numbers
                              cursorColor: Colors.red, // Change the color of the cursor
                              decoration: InputDecoration(
                                hintText: 'Enter points',
                                hintStyle: const TextStyle(
                                  fontFamily: 'NexaRegular',
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue), // Change the color of the border
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder( // Change the border color when the field is focused
                                  borderSide: BorderSide(color: primary), // Change the color of the focused border
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                              // Add your logic to handle the entered points
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20, left: 100, right: 100),
                  child: ElevatedButton(
                    onPressed: saveData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary, // Background color
                      foregroundColor: Colors.white, // Text color
                      elevation: 5, // Elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 20), // Adjust vertical padding here
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ // Icon
                        SizedBox(width: 0),
                        Text(
                          'Save',
                          style: TextStyle(fontSize: 18, fontFamily: 'NexaRegular'),
                        ),
                      ],
                    ),
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
