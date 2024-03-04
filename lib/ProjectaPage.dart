


import 'package:flutter/material.dart';


class ProjectaPage extends StatelessWidget {
final Color primary = const Color(0xffeef444c);
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Smart-HR'),
),
body: Center(

child:SingleChildScrollView(
child:Column(
children: [
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
'Add module:',
style: TextStyle(
fontSize: 21,
fontFamily: "NexaBold",
color: Colors.black,
),
),
SizedBox(height: 1.0),
TextField(
maxLines: 2,
decoration: InputDecoration(
hintText: 'Enter employee project technology',
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
'Add task:',
style: TextStyle(
fontSize: 21,
fontFamily: "NexaBold",
color: Colors.black,
),
),
SizedBox(height: 1.0),
TextField(
maxLines: 2,
decoration: InputDecoration(
hintText: 'Enter employee project task',
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
'By whom:',
style: TextStyle(
fontSize: 21,
fontFamily: "NexaBold",
color: Colors.black,
),
),
SizedBox(height: 1.0),
TextField(
maxLines: 2,
decoration: InputDecoration(
hintText: 'Enter employee names',
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
'Add deadline:',
style: TextStyle(
fontSize: 21,
fontFamily: "NexaBold",
color: Colors.black,
),
),
SizedBox(height: 1.0),
TextField(
maxLines: 2,
decoration: InputDecoration(
hintText: 'Enter employee project daedline',
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
),
);
}
}
