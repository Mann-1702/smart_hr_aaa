import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_hr_aaa/admintodayscreen.dart';
import 'package:smart_hr_aaa/profilescreen.dart';

import 'adminrewards.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),

    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = picked.toString(); // You can format the date as needed
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color primary = const Color(0xffeef444c);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Registration Page',
          style: TextStyle(
            fontFamily: 'NexaBold',
          ),

        ),
          backgroundColor: primary,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xffeef444c),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Icon(
                        Icons.person,
                        color: Colors.black26,
                        size: 55,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    'Hello, Admin!',
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
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 17,
                  color: primary,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminTodayScreen()));
              },
            ),
            ListTile(
              title: const Text(
                'Reward Settings',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 17,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminRewards()));
              },
            ),
            ListTile(
              title: Text(
                'Training & Development',
                style: TextStyle(
                  fontFamily: 'NexaRegular',
                  fontSize: 17,
                ),
              ),
              // onTap: () {
              //   Navigator.pop(context);
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const AdminRewards()));
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight / 3.0,
              width: screenWidth,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    height: 240,
                    width: 600,
                    child: Lottie.asset("assets/registration.json"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight / 15, bottom: screenHeight / 20),
              child: Text(
                "Registration",
                style: TextStyle(
                  fontSize: screenWidth / 18,
                  fontFamily: "NexaBold",
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: screenWidth / 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fieldTitle("First Name"),
                  customField("Enter your First Name", _firstNameController),
                  fieldTitle("Last Name"),
                  customField("Enter your Last Name", _lastNameController),
                  fieldTitle("Date of Birth"),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: customField("Select your Date of Birth", _dobController),
                    ),
                  ),
                  fieldTitle("Contact Number"),
                  customField("Enter your Contact Number", _contactNumberController),
                  fieldTitle("Employee ID"),
                  customField("Enter your Employee ID", _employeeIdController),
                  fieldTitle("Password"),
                  customField("Enter your Password", _passwordController, obscure: true),
                  fieldTitle("Address"),
                  customField("Enter your Address", _addressController),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // Retrieve the data from the text controllers
                      String firstName = _firstNameController.text.trim();
                      String lastName = _lastNameController.text.trim();
                      String dob = _dobController.text.trim();
                      String contactNumber = _contactNumberController.text.trim();
                      String employeeId = _employeeIdController.text.trim();
                      String password = _passwordController.text.trim();
                      String address = _addressController.text.trim();

                      // Create a map to represent the employee data
                      Map<String, dynamic> employeeData = {
                        'firstName': firstName,
                        'lastName': lastName,
                        'birthDate': dob,
                        'contactNumber': contactNumber,
                        'id': employeeId,
                        'password': password,
                        'address': address,
                        'canEdit': false,
                      };

                      // Get a reference to the Firestore collection
                      CollectionReference employeesCollection = FirebaseFirestore.instance.collection('Employee');

                      try {
                        // Add the employee data to Firestore
                        await employeesCollection.doc('$employeeId').set(employeeData);
                        print('Employee data added to Firestore');

                        // Show a success message to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration successful')),
                        );
                      } catch (error) {
                        // Show an error message if something goes wrong
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $error')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primary,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 3,
                    ),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: screenWidth / 24,
                          fontFamily: 'NexaBold',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontFamily: "NexaBold",
        ),
      ),
    );
  }

  Widget customField(String hint, TextEditingController controller, {bool obscure = false}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
          maxLines: 1,
          obscureText: obscure,
        ),
      ),
    );
  }
}
