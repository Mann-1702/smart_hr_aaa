import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_hr_aaa/profilescreen.dart';

import 'MyRewards.dart';
import 'homescreen.dart';
import 'model/user.dart';

class TranndevScreen extends StatefulWidget {
  const TranndevScreen({Key? key}) : super(key: key);

  @override
  _TranndevScreenState createState() => _TranndevScreenState();
}

class _TranndevScreenState extends State<TranndevScreen> {
  String _selectedItem = 'Item 1'; // Initialize selected item
  String? _certificatePath; // Holds the path of the selected certificate file
  DateTime? _selectedDate;// Define _selectedDate variable here
  DateTime? _selectedEndDate; // Define _selectedEndDate
  final Color primary = const Color(0xffeef444c);
  bool _isSelectedHTML = false;
  bool _isSelectedCSS = false;
  bool _isSelectedJavaScript = false;
  List<String> skillsData = [];
  List<String> languagesData = [];

  final TextEditingController skillsController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();

  @override
  void dispose() {
    skillsController.dispose();
    languagesController.dispose();
    super.dispose();
  }

  Future<void> submitForm() async {

    if (skillsController.text.isEmpty || languagesController.text.isEmpty || _selectedItem.isEmpty ||
        _selectedDate==null || _selectedEndDate==null || _certificatePath==null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all the above fields!')),
      );
      return; // Exit the function early
    }

    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection(("Employee"))
        .where('id', isEqualTo: User.employeeId)
        .get();

    DocumentReference recordRef = FirebaseFirestore.instance
        .collection("Employee")
        .doc(snap.docs[0].id)
        .collection("Traindev")
        .doc(skillsController.text);

    try {

      await  FirebaseFirestore.instance
          .collection("Employee")
          .doc(snap.docs[0].id)
          .collection("Traindev")
          .doc(skillsController.text)
          .set({
        'skills': skillsController.text,
        'languages': languagesController.text,
        'reference': _selectedItem,
        'startDate': _selectedDate,
        'endDate': _selectedEndDate,
        'certificate': _certificatePath,
      });
      skillsController.clear();
      languagesController.clear();

      setState(() {
        _selectedDate = null;
        _selectedEndDate = null;
        _certificatePath = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully')),
      );
    }
    catch (e) {
      print("Error updating record: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSkillsData();
    fetchLanguagesData();
  }

  Future<void> _pickCertificate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    _certificatePath = "Selected Certificate File Path"; // Replace this with actual file path
    setState(() {}); // Trigger a rebuild to reflect the changes

    if (result != null) {
      setState(() {
        _certificatePath = result.files.single.path;
      });
    }
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    return picked;
  }


  Future<void> fetchSkillsData() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("Employee")
          .where('id', isEqualTo: User.employeeId)
          .get();

      List<String> allSkills = []; // List to store skills from all dates

      // Fetch documents from the Traindev collection
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Employee")
          .doc(snap.docs[0].id)
          .collection("Traindev")
          .get();

      // Iterate through each document and retrieve skills
      querySnapshot.docs.forEach((doc) {
        String skills = doc.get('skills');
        if (skills != null && skills.isNotEmpty) {
          allSkills.add(skills); // Add skills to the list
        }
      });

      setState(() {
        skillsData = allSkills; // Update skillsData with skills from all dates
      });

    } catch (e) {
      print('Error fetching skills data: $e');
    }
  }


  Future<void> fetchLanguagesData() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("Employee")
          .where('id', isEqualTo: User.employeeId)
          .get();

      List<String> allLanguages = [];

      // Fetch documents from the Traindev collection
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Employee")
          .doc(snap.docs[0].id)
          .collection("Traindev")
          .get();

      // Iterate through each document and retrieve skills
      querySnapshot.docs.forEach((doc) {
        String languages = doc.get('languages');
        if (languages != null && languages.isNotEmpty) {
          allLanguages.add(languages); // Add skills to the list
        }
      });

      setState(() {
        languagesData = allLanguages; // Update skillsData with skills from all dates
      });

    } catch (e) {
      print('Error fetching languages data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Training & Development',
            style: TextStyle(
                fontFamily: "NexaRegular",
                color: Colors.white),
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
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xffeef444c),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()));
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
                    Text(
                      'Hello, ${User.employeeId}',
                      style: const TextStyle(
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
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  'Rewards',
                  style: TextStyle(
                    fontFamily: 'NexaRegular',
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyRewards()));
                },
              ),
              ListTile(
                title: Text(
                  'Training & Development',
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
        body: TabBarView(
          children: [
            //container-nls1
            SingleChildScrollView(// First tab content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //container-nls1
                  Container(
                    width: 400,
                    height: 240,
                    margin: EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 3), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/newlg.png', // Replace 'example.jpg' with your image path
                      fit: BoxFit.cover, // Adjust the fit of the image within the container
                    ),
                  ),

                  Container(
                    width: 400,
                    height: 240,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 3), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Skills :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 1.0), // Add some space between the text and the text field
                            TextField(
                              controller: skillsController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your skills',
                                border: OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 8.0),
                            const Text(
                              'Languages :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 1.0), // Add some space between the text and the text field
                            TextField(
                              controller: languagesController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your skills',
                                border: OutlineInputBorder(),
                              ),
                            ),

                          ],

                        ),

                      ),
                    ),
                  ),

                  //container-nls2
                  Container(
                    width: 400,
                    height: 120,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 3), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Reference resources:',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: _selectedItem,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Item 1',
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.assistant_photo,
                                            color: Colors.blueGrey,), // Icon for the first item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('AI assistance'),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Item 2',
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.code,
                                            color: Colors.black,), // Icon for the second item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('Github'),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Item 3',
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.video_library,
                                            color: Colors.red,), // Icon for the third item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('Youtube'),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Item 4',
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.web,
                                            color: Colors.blue,), // Icon for the fourth item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('Online-template'),
                                        ],
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) async {
                                    setState(() {
                                      _selectedItem = value!; // Update selected item
                                    });
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //container-nls3
                  Container(
                    width: 400,
                    height: 145,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 3), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Duration time:',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Starting date:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8.0),


                                ElevatedButton(
                                  onPressed: () async {
                                    DateTime? startDate = await _selectDate(context);
                                    if (startDate != null) {
                                      setState(() {
                                        _selectedDate = startDate;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary, // Background color
                                    foregroundColor: Colors.white, // Text color
                                    elevation: 5, // Elevation
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // BorderRadius
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10), // Padding
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 8),
                                      Text(
                                        'Select Date',
                                        style: TextStyle(fontSize: 14, fontFamily: 'NexaRegular'),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 8.0),
                                _selectedDate != null
                                    ? Text(
                                  '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                )
                                    : const SizedBox.shrink(),
                              ],
                            ),

                            Row(
                              children: [
                                const Text(
                                  'Ending date:    ', // Change 'Starting date' to 'End date'
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    DateTime? startEndDate = await _selectDate(context);
                                    if (startEndDate != null) {
                                      setState(() {
                                        _selectedEndDate = startEndDate;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary, // Background color
                                    foregroundColor: Colors.white, // Text color
                                    elevation: 5, // Elevation
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // BorderRadius
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10), // Padding
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 8),
                                      Text(
                                        'Select Date',
                                        style: TextStyle(fontSize: 14, fontFamily: 'NexaRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                _selectedEndDate != null // Change _selectedDate to _selectedEndDate
                                    ? Text(
                                  '${_selectedEndDate!.day}-${_selectedEndDate!.month}-${_selectedEndDate!.year}',
                                  // Change _selectedDate to _selectedEndDate
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //container-nls4
                  Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child:
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Certificates:',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: _pickCertificate,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary, // Background color
                                    foregroundColor: Colors.white, // Text color
                                    elevation: 5, // Elevation
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // BorderRadius
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10), // Padding
                                  ),
                                  child: const Text('Add Certificate'
                                    ,style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'NexaRegular',// Color of the text
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 0.0),
                                _certificatePath != null
                                    ? Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _certificatePath!,
                                    style: const TextStyle(
                                      fontSize: 3,
                                      fontFamily: "NexaRegular",
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),

                  // container nls5
                  Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 3), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          submitForm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary, // Background color
                          foregroundColor: Colors.white, // Text color
                          elevation: 5, // Elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 35), // Padding
                        ),
                        child: const Text('Submit'
                          ,style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NexaBold',
                            fontSize: 18,// Color of the text
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            //---------------------------------------------------------------------------------------------------------------------------------
            // container of skill-known
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 240,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.5), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/skills.png',
                    fit: BoxFit.cover,
                  ),
                ),
                //skill-known container
                const SizedBox(height: 50.0),
                Container(
                  width: 400,
                  height: 300,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.5), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: const Offset(0, 3), // Offset in x and y directions
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Skills known by you:',
                            style: TextStyle(
                              fontSize: 21,
                              fontFamily: "NexaBold",
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Skills :',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "NexaBold",
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Expanded(
                            child: ListView.builder(
                              itemCount: skillsData.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  skillsData[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "NexaRegular",
                                    color: Colors.black,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Languages :',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "NexaBold",
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Expanded(
                            child: ListView.builder(
                              itemCount: languagesData.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  languagesData[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "NexaRegular",
                                    color: Colors.black,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),


//---------------------------------------------------------------------------------------------------

            //container3-seminar tabview3

            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    height: 250,
                    margin: EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/sem.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: 400,
                    height: 250,
                    margin: EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seminars:',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Upcoming Seminars',
                              style: TextStyle(
                                fontSize: 19,
                                fontFamily: "NexaRegular",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                height: 130,
                                child: StreamBuilder(
                                  stream: FirebaseFirestore.instance.collection('Seminar').snapshots(),
                                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Center(child: CircularProgressIndicator());
                                    }
                                    if (snapshot.hasError) {
                                      return Center(child: Text('Error: ${snapshot.error}'));
                                    }
                                    final seminars = snapshot.data!.docs;
                                    final now = DateTime.now().millisecondsSinceEpoch;
                                    final upcomingSeminars = seminars.where((seminar) => (seminar['date'] as Timestamp).millisecondsSinceEpoch > now).toList();

                                    // Delete expired seminars
                                    for (final seminar in seminars) {
                                      final DateTime date = (seminar['date'] as Timestamp).toDate();
                                      if (date.isBefore(DateTime.now())) {
                                        seminar.reference.delete();
                                      }
                                    }

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: upcomingSeminars.length,
                                      itemBuilder: (context, index) {
                                        final seminar = upcomingSeminars[index];
                                        final title = seminar['title'];
                                        final place = seminar['place'];
                                        final DateTime date = (seminar['date'] as Timestamp).toDate();
                                        final formattedDate = '${date.day}/${date.month}/${date.year}';
                                        return Container(
                                          width: 200,
                                          margin: EdgeInsets.only(right: 16.0),
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title,
                                                style: TextStyle(
                                                  fontFamily: 'NexaBold',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                place,
                                                style: TextStyle(
                                                  fontFamily: 'NexaRegular',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Text(
                                                'Date: $formattedDate',
                                                style: TextStyle(
                                                  fontFamily: 'NexaRegular',
                                                  fontSize: 14,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
//---------------------------------------------------------------------------------------------
          ],
        ),

        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: const Icon(Icons.library_books), // Add icon for 'New learning'
              child: Container(
                child: const Text(
                  'New learning',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "NexaBold",
                    color: Colors.black,
                  ),
                ),// Add text for 'New learning'
              ),
            ),
            const Tab(
              icon: Icon(Icons.lightbulb_outline),
              child: Text(
                'Skill known',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "NexaBold",
                  color: Colors.black,
                ),
              ),// Add icon for 'Skill known'

            ),
            const Tab(
              icon: Icon(Icons.event), // Add icon for 'Seminar&work-shop'
              child: Text(
                'Seminars',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "NexaBold",
                  color: Colors.black,
                ),
              ),
            ),
          ],
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsets.all(5.0),
          indicatorColor: Colors.redAccent,
        ),
      ),
    );
  }
}