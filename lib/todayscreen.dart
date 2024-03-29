import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
//import 'package:smart_hr_aaa/TranndevScreen.dart';
import 'package:smart_hr_aaa/model/user.dart';
import 'package:smart_hr_aaa/profilescreen.dart';
import 'package:smart_hr_aaa/services/location_service.dart';

import 'MyRewards.dart';
import 'TranndevScreen.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);


  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool isDataMatched=false;

  Timestamp? checkInTimestamp;
  Timestamp? checkOutTimestamp;
  String location = " ";
  String scanResult = " ";
  String officeCode = " ";

  String checkInLocation = " ";

  String checkOutLocation = " ";


  Color primary = const Color(0xffeef444c);

  @override
  void initState() {
    super.initState();
    _getRecord();
    _getOfficeCode();
  }


  void _getLocation() async {
    try {
      double? latitude = await LocationService().getLatitude();
      double? longitude = await LocationService().getLongitude();

      if (latitude != null && longitude != null) {
        List<Placemark> placemark = await placemarkFromCoordinates(latitude, longitude);

        setState(() {
          location = "${placemark[0].name}, ${placemark[0].street} , ${placemark[0].administrativeArea}, ${placemark[0].postalCode}, ${placemark[0].country}";
        });
      } else {
        print("Error: Failed to get location coordinates.");
      }
    } catch (e) {
      print("Error: $_getLocation - $e");
    }
  }
  void _getOfficeCode() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Attributes").doc("Office1").get();
    setState(() {
      officeCode = snap['code'];
    });
  }

  Future<void> scanQR() async {
    String result = " ";

    try {
      result = await FlutterBarcodeScanner.scanBarcode(
        "#ffffff",
        "Cancel",
        false,
        ScanMode.QR,
      );
      // Check if the scanned QR code matches with the data in Firebase
      bool match = await _checkQRData(result);
      setState(() {
        scanResult = result;
        isDataMatched = match;
      });
    } catch (e) {
      print("Error");
    }

    setState(() {
      scanResult = result;
    });
  }

  Future<bool> _checkQRData(String qrData) async {
    // Fetch the data from Firebase and compare with the scanned QR code data
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection(("qrCodes"))
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();
      String firebaseData = snapshot['qrData'];
      return qrData == firebaseData;
    } catch (e) {
      print("Error checking QR data: $e");
      return false;
    }
  }

  void _getRecord() async {
    try {
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

      setState(() {
        checkInTimestamp = snap2['checkIn'];
        checkOutTimestamp = snap2['checkOut'];
        checkInLocation = snap2['checkInLocation'] ?? location;
        checkOutLocation = snap2['checkOutLocation'] ?? location;
      });
    } catch (e) {
      setState(() {
        checkInTimestamp = null;
        checkOutTimestamp = null;
        checkInLocation = location;
        checkOutLocation = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart HR',
          style: TextStyle(
            fontFamily: 'NexaBold',
          ),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome, ",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "NexaRegular",
                  fontSize: screenWidth / 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Employee " + User.employeeId,
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: screenWidth / 18,
                ),
              ),
            ),
            Visibility(
              visible: isDataMatched,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 32),
                child: Text(
                  "Today's Status",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "NexaBold",
                    fontSize: screenWidth / 18,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isDataMatched,
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Check In",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: screenWidth / 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            checkInTimestamp != null
                                ? DateFormat('hh:mm a').format(checkInTimestamp!.toDate())
                                : "--/--",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: screenWidth / 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Check Out",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: screenWidth / 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            checkOutTimestamp != null
                                ? DateFormat('hh:mm a').format(checkOutTimestamp!.toDate())
                                : "--/--",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: screenWidth / 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                    color: primary,
                    fontSize: screenWidth / 18,
                    fontFamily: "NexaBold",
                  ),
                  children: [
                    TextSpan(
                      text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('hh:mm:ss a').format(DateTime.now()),
                    style: TextStyle(
                      fontFamily: "NexaRegular",
                      fontSize: screenWidth / 20,
                      color: Colors.black54,
                    ),
                  ),
                );
              },
            ),
            checkOutTimestamp == null
                ? Visibility(
              visible: isDataMatched,
              child: Container(
                margin: const EdgeInsets.only(top: 24, bottom: 12),
                child: Builder(
                  builder: (context) {
                    final GlobalKey<SlideActionState> key = GlobalKey();
                    return SlideAction(
                      text: checkInTimestamp == null ? "Slide to Check In" : "Slide to Check Out",
                      textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: screenWidth / 20,
                        fontFamily: "NexaRegular",
                      ),
                      outerColor: Colors.white,
                      innerColor: primary,
                      key: key,
                      onSubmit: () async {

                        if(User.lat != 0) {
                          _getLocation();
                          QuerySnapshot snap = await FirebaseFirestore.instance
                              .collection(("Employee"))
                              .where('id', isEqualTo: User.employeeId)
                              .get();

                          DocumentReference recordRef = FirebaseFirestore.instance
                              .collection("Employee")
                              .doc(snap.docs[0].id)
                              .collection("Record")
                              .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()));

                          try {
                            if (checkInTimestamp == null) {
                              setState(() {
                                checkInTimestamp = Timestamp.now();
                              });
                              await  FirebaseFirestore.instance
                                  .collection("Employee")
                                  .doc(snap.docs[0].id)
                                  .collection("Record")
                                  .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                                  .set({
                                'date': Timestamp.now(),
                                'checkIn': Timestamp.now(),
                                'checkInLocation': checkInLocation,

                              });
                            } else {
                              setState(() {
                                checkOutTimestamp = Timestamp.now();
                                checkOutLocation = location;

                              });
                              await FirebaseFirestore.instance
                                  .collection("Employee")
                                  .doc(snap.docs[0].id)
                                  .collection("Record")
                                  .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                                  .update({
                                'checkOut': Timestamp.now(),

                                'checkOutLocation': checkOutLocation,
                              });
                            }
                          } catch (e) {
                            print("Error updating record: $e");
                          }

                          key.currentState!.reset();
                        } else {
                          // Handle location unavailable
                        }
                      },
                    );
                  },
                ),
              ),
            )
                : Visibility(
              visible: isDataMatched,
              child: Container(
                margin: const EdgeInsets.only(top: 32, bottom: 32),
                child: Text(
                  "You have completed this day!",
                  style: TextStyle(
                    fontFamily: "NexaRegular",
                    fontSize: screenWidth / 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            location != " " ? Text(
              "Location: $location",
            ) : const SizedBox(),
            GestureDetector(
              onTap: () {
                scanQR();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: screenWidth / 2,
                width: screenWidth / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.expand,
                          size: 70,
                          color: primary,
                        ),
                        Icon(
                          FontAwesomeIcons.camera,
                          size: 25,
                          color: primary,
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Scan to Check In",
                        style: TextStyle(
                          fontFamily: "NexaRegular",
                          fontSize: screenWidth / 20,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}