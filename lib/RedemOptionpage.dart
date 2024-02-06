import 'package:flutter/material.dart';

class RedemOptionpage extends StatelessWidget {

  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redeem Rewards',style: TextStyle(color: Colors.white, fontFamily: 'NexaRegular'),),
        backgroundColor: primary,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this color to your desired color
        ),
      ),
      body:  SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300.0, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.white, // Adjust the color of the rectangle box
                borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                // gradient: const LinearGradient(
                //   colors: [Colors.white, Colors.white12], // Define your gradient colors
                //   begin: Alignment.centerLeft,
                //   end: Alignment.topRight,
                // ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.redAccent.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: const Offset(0, 3), // changes the position of the shadow
                //   ),
                // ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/redem.jpg', // Replace with the actual path to your image asset
                    width: 400.0, // Adjust the width as needed
                    height: 200.0, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Redeem your rewards here!',
                    style: TextStyle(color: primary,fontFamily: 'NexaBold',fontSize: 25),
                  ),
                ],
              ),
            ),
            //box1
            Container(
              height: 300.0, // Adjust the height as needed
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/agift.png', // Replace with the actual path to your image asset
                    width: 150.0, // Adjust the width as needed
                    height: 100.0, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'You have two gift cards of worth Rs.500 ',
                    style: TextStyle(color: Colors.black, fontFamily: 'NexaRegular'),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'for good performance and attendance points!',
                    style: TextStyle(color: Colors.black,fontFamily: 'NexaRegular'),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'REDEEM YOUR REWARD',
                    style: TextStyle(fontSize: 18,
                        fontFamily: "NexaBold",
                        color: primary),
                  ),
                ],
              ),
            ),
            //box2
            Container(
              height: 300.0, // Adjust the height as needed
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/net.jpg', // Replace with the actual path to your image asset
                    width: 150.0, // Adjust the width as needed
                    height: 100.0, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'You have 3 months subscription of Netflix!',
                    style: TextStyle(color: Colors.black,fontFamily: 'NexaRegular'),
                  ),
                  const SizedBox(height: 16.0),
                  Text('REDEEM YOUR REWARD',
                    style: TextStyle(fontSize: 18,
                        fontFamily: "NexaBold",
                        color: primary),
                  ),
                ],
              ),
            ),
            //box3
            Container(
              height: 300.0, // Adjust the height as needed
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tr.png', // Replace with the actual path to your image asset
                    width: 150.0, // Adjust the width as needed
                    height: 100.0, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'You have got 7 days holiday package to Goa!',
                    style: TextStyle(color: Colors.black,fontFamily: 'NexaRegular'),
                  ),
                  const SizedBox(height: 16.0),
                  Text('REDEEM YOUR REWARD',
                    style: TextStyle(fontSize: 18,
                      fontFamily: "NexaBold",
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),
            //box3
            Container(
              height: 300.0, // Adjust the height as needed
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/rest.jpg', // Replace with the actual path to your image asset
                    width: 150.0, // Adjust the width as needed
                    height: 100.0, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'You got a voucher of Rs.2000',
                    style: TextStyle(color: Colors.black,fontFamily: 'NexaRegular'),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'at any restaurant!',
                    style: TextStyle(color: Colors.black,fontFamily: 'NexaRegular'),
                  ),
                  const SizedBox(height: 16.0),
                  Text('REDEEM YOUR REWARD',
                    style: TextStyle(fontSize: 18,
                      fontFamily: "NexaBold",
                      color: primary,
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
}