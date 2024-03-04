import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import 'ProjectaPage.dart';


class ProjectntaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ProjectntaskScreenWidget(); // Use const keyword here
  }
}

class ProjectntaskScreenWidget extends StatefulWidget {
  const ProjectntaskScreenWidget(); // Add const constructor here

  @override
  _ProjectntaskScreenState createState() => _ProjectntaskScreenState();
}

class _ProjectntaskScreenState extends State<ProjectntaskScreenWidget> {
  final Color primary = const Color(0xffeef444c);
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedEndDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'PROJECT AND TASK',
            style: TextStyle(fontSize: 18,
                fontFamily: "NexaBold",
                color: Colors.white),
          ),
          backgroundColor: primary,
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  //NEW PROJECT
                  Container(
                    width: 411,
                    height: 240,
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
                      'assets/images/prjt.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: 400,
                    height: 240,
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
                              'Project title :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 1.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your project title',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Memebers name :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 1.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your members name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: 400,
                    height: 240,
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
                              'Project description :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 1.0),
                            TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Enter your project description',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 50.0),
                  Container(
                    width: 400,
                    height: 240,
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
                              'Project demand technology :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 1.0),
                            TextField(
                              maxLines: 2,
                              decoration: InputDecoration(
                                hintText: 'Enter your project technology',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 50.0),
                  Container(
                    width: 400,
                    height: 200,
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
                              'Project Duration :',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "NexaBold",
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Text(
                                  'Start Date:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    await _selectDate(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: primary,
                                  ),
                                  child: Text(
                                    'Select date',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                _selectedStartDate != null
                                    ? Text(
                                  '${_selectedStartDate!.day}-${_selectedStartDate!.month}-${_selectedStartDate!.year}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                )
                                    : SizedBox.shrink(),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Text(
                                  'Expected End Date:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "NexaBold",
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    await _selectEndDate(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: primary,
                                  ),
                                  child: Text(
                                    'Select date',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                _selectedEndDate != null
                                    ? Text(
                                  '${_selectedEndDate!.day}-${_selectedEndDate!.month}-${_selectedEndDate!.year}',
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
//-------------------------------------------------------------------------------------------------------------
            //CURRENT PROJECT

            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    height: 240,
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
                      'assets/images/curnproj.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SingleChildScrollView(
                    child:Container(
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
                                'List of current project:',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontFamily: "NexaBold",
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to another page when the tile is tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProjectaPage()),
                                  );
                                },
                                child: ListTile(
                                  // Example leading icon
                                  title: Text('Smart-HR project'),
                                  subtitle: Text('Tile 1 Subtitle'),
                                ),
                              ),
                              Divider(), // Divider between ListTile widgets
                              GestureDetector(
                                onTap: () {
                                  // Navigate to another page when the tile is tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProjectaPage()),
                                  );
                                },
                                child: ListTile(
                                  // Example leading icon
                                  title: Text('Food-bear project'),
                                  subtitle: Text('Tile 2 Subtitle'),
                                ),
                              ),
                              Divider(), // Divider between ListTile widgets
                              GestureDetector(
                                onTap: () {
                                  // Navigate to another page when the tile is tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProjectaPage()),
                                  );
                                },
                                child: ListTile(
                                  // Example leading icon
                                  title: Text('E-wallet app'),
                                  subtitle: Text('Tile 3 Subtitle'),
                                ),
                              ),
                              Divider(), // Divider between ListTile widgets
                              GestureDetector(
                                onTap: () {
                                  // Navigate to another page when the tile is tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProjectaPage()),
                                  );
                                },
                                child: ListTile(
                                  // Example leading icon
                                  title: Text('grocery-buy app'),
                                  subtitle: Text('Tile 3 Subtitle'),
                                ),
                              ),

                              // Add more ListTile widgets as needed
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
//--------------------------------------------------------------------------------------------------------
        bottomNavigationBar: Container(
          width: 90,
          height: 90,
          child: TabBar(
            tabs: [
              Tab(
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/images/pricon.jpg',
                      width: 25,
                      height: 25,
                    ),
                    Text(
                      'New project',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "NexaBold",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                icon: Column(
                  children: [
                    Image.asset(
                      'assets/images/curprj.png',
                      width: 25,
                      height: 25,
                    ),
                    Text(
                      'Current project',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "NexaBold",
                        color: Colors.black,
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
