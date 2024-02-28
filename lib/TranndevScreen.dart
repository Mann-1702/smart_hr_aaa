import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smart_hr_aaa/profilescreen.dart';

import 'MyRewards.dart';
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
  bool _isSelectedJavaScript = false; // Define _isSelected variable and initialize it with false
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

  @override
  Widget build(BuildContext context) {
    appBar: AppBar(
      title: const Text(
        'Smart HR',
        style: TextStyle(
          fontFamily: 'NexaBold',
        ),
      ),
    );
    drawer: Drawer(
    child: ListView( padding: EdgeInsets.zero,
    children: <Widget>[DrawerHeader(
    decoration: const BoxDecoration(
    color: Color(0xffeef444c),
    ),
    child:  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [GestureDetector(
    onTap: () {
    Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen()));
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
    ),
    ),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TranndevScreen()));
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
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'TRAINING AND DEVELOPMENT',
            style: TextStyle(
                fontSize: 18,
                fontFamily: "NexaBold",
                color: Colors.white),
          ),
          backgroundColor: primary,
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
                          offset: Offset(0, 3), // Offset in x and y directions
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
                    margin: EdgeInsets.only(bottom: 8.0),
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
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skills :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 1.0), // Add some space between the text and the text field
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your skills',
                                border: OutlineInputBorder(),
                              ),
                            ),

                            SizedBox(height: 8.0),
                            Text(
                              'Languages :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 1.0), // Add some space between the text and the text field
                            TextField(
                              decoration: InputDecoration(
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
                    margin: EdgeInsets.only(bottom: 8.0),
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
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
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
                                  items: [
                                    DropdownMenuItem(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.assistant_photo,
                                            color: Colors.blueGrey,), // Icon for the first item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('AI assistance'),
                                        ],
                                      ),
                                      value: 'Item 1',
                                    ),
                                    DropdownMenuItem(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.code,
                                            color: Colors.black,), // Icon for the second item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('Github'),
                                        ],
                                      ),
                                      value: 'Item 2',
                                    ),
                                    DropdownMenuItem(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.video_library,
                                            color: Colors.red,), // Icon for the third item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('Youtube'),
                                        ],
                                      ),
                                      value: 'Item 3',
                                    ),
                                    DropdownMenuItem(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.web,
                                            color: Colors.blue,), // Icon for the fourth item
                                          SizedBox(width: 8), // Add some space between icon and text
                                          Text('Online-template'),
                                        ],
                                      ),
                                      value: 'Item 4',
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedItem = value!; // Update selected item
                                    });
                                  },
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Selected: $_selectedItem', // Show selected item here
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
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
                    margin: EdgeInsets.only(bottom: 8.0),
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
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Duration time:',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Starting date:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8.0),
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
                                      primary: primary // Background color of button
                                  ),
                                  child: Text(
                                    'Select Date',
                                    style: TextStyle(
                                      color: Colors.white, // Color of the text
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                _selectedDate != null
                                    ? Text(
                                  '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                )
                                    : SizedBox.shrink(),
                              ],
                            ),

                            Row(
                              children: [
                                Text(
                                  'Ending date:', // Change 'Starting date' to 'End date'
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    DateTime? endDate = await _selectDate(context); // Change variable name to endDate
                                    if (endDate != null) {
                                      setState(() {
                                        _selectedEndDate = endDate; // Change _selectedDate to _selectedEndDate
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: primary, // Background color of button
                                  ),
                                  child: Text(
                                    'Select Date',
                                    style: TextStyle(
                                      color: Colors.white, // Color of the text
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                _selectedEndDate != null // Change _selectedDate to _selectedEndDate
                                    ? Text(
                                  '${_selectedEndDate!.day}-${_selectedEndDate!.month}-${_selectedEndDate!.year}',
                                  // Change _selectedDate to _selectedEndDate
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                )
                                    : SizedBox.shrink(),
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
                            Text(
                              'Certificates:',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: _pickCertificate,
                                  style: ElevatedButton.styleFrom(
                                    primary: primary, // Change the color here
                                  ),
                                  child: Text('Add Certificate'
                                    ,style: TextStyle(
                                      color: Colors.white, // Color of the text
                                    ),
                                  ),
                                ),
                                SizedBox(width: 0.0),
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
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    _certificatePath!,
                                    style: TextStyle(
                                      fontSize: 3,
                                      fontFamily: "NexaRegular",
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                                    : SizedBox.shrink(),
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
                          offset: Offset(0, 3), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your button onPressed functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: primary, // Change the color here
                        ),
                        child: Text('Submit'
                          ,style: TextStyle(
                            color: Colors.white, // Color of the text
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
                  margin: EdgeInsets.only(bottom: 8.0),
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
                  child: Image.asset(
                    'assets/images/skills.png', // Replace 'example.jpg' with your image path
                    fit: BoxFit.cover, // Adjust the fit of the image within the container
                  ),
                ),
                //skill-known container
                SizedBox(height: 50.0),
                Container(
                  width: 400,
                  height: 300,
                  margin: EdgeInsets.only(bottom: 8.0),
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
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Skills known by you:',
                            style: TextStyle(
                              fontSize: 21,
                              fontFamily: "NexaBold",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Skills :',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "NexaBold",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Frontend,Backend',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "NexaRegular",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Languages :',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "NexaBold",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'HTML',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "NexaRegular",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Javascript',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "NexaRegular",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Bootstrap',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "NexaRegular",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'UI/UX design interface',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "NexaRegular",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Firebase',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "NexaRegular",
                              color: Colors.black,
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
                    height: 400,
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
                              'Select seminar on the basis of your skills',
                              style: TextStyle(
                                fontSize: 19,
                                fontFamily: "NexaRegular",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ListView(
                              shrinkWrap: true,
                              children: [
                                CheckboxListTile(
                                  title: Text('Seminar on HTML'),
                                  value: _isSelectedHTML,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isSelectedHTML = value!;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Seminar on CSS'),
                                  value: _isSelectedCSS,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isSelectedCSS = value!;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Seminar on JavaScript'),
                                  value: _isSelectedJavaScript,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isSelectedJavaScript = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0), // Add space between the ListView and the ElevatedButton
                            ElevatedButton(
                              onPressed: () {
                                // Add functionality for the ElevatedButton
                              },
                              style: ElevatedButton.styleFrom(
                                primary: primary, // Change the color here
                              ),
                              child: Text('Submit'
                                ,style: TextStyle(
                                  color: Colors.white, // Color of the text
                                ),
                              ), // Text displayed on the ElevatedButton
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: 400,
                    height: 300,
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
                              'Up-coming seminar events:',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Add space between the text and image
                                // Image
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/dgm.png'), // Replace 'your_image.png' with your image asset
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                SizedBox(width: 16.0), // Add space between the image and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Seminar on Digital Marketing:',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "NexaBold",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'This seminar is conducted on', // Add another text below the existing one
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "NexaRegular",
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      '15th march 2024', // Add another text below the existing one
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "NexaRegular",
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Add space between the text and image
                                // Image
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/uiux.png'), // Replace 'your_image.png' with your image asset
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                SizedBox(width: 16.0), // Add space between the image and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Seminar on UI/UX ',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "NexaBold",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'design interface:',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "NexaBold",
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'This seminar is conducted on', // Add another text below the existing one
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "NexaRegular",
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      '20th march 2024', // Add another text below the existing one
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "NexaRegular",
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
//---------------------------------------------------------------------------------------------
          ],
        ),

        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.library_books), // Add icon for 'New learning'
              child: Container(
                child: Text(
                  'New learning',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "NexaBold",
                    color: Colors.black,
                  ),
                ),// Add text for 'New learning'
              ),
            ),
            Tab(
              icon: Icon(Icons.lightbulb_outline),
              child: Container(
                child: Text(
                  'Skill known',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "NexaBold",
                    color: Colors.black,
                  ),
                ),// Add text for 'New learning'
              ),// Add icon for 'Skill known'

            ),
            Tab(
              icon: Icon(Icons.event), // Add icon for 'Seminar&work-shop'
              child: Container(
                child: Text(
                  'Seminars',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "NexaBold",
                    color: Colors.black,
                  ),
                ),// Add text for 'New learning'
              ),
            ),
          ],
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.redAccent,
        ),
      ),
    );
  }
}
