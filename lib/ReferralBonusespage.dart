import 'package:flutter/material.dart';

class ReferralBonusespage extends StatelessWidget {

  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral bonus',style: TextStyle(
            color: Colors.white,
            fontFamily: 'NexaRegular'
        ),),
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
                gradient: LinearGradient(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ref.jpg', // Replace with the actual path to your image asset
                    width: 400.0, // Adjust the width as needed
                    height: 200.0, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'This is the Referral bonus',
                    style: TextStyle(color: Colors.black, fontFamily: 'NexaRegular'),
                  ),
                ],
              ),
            ),
            //box 1
            Container(
              height: 150.0, // Adjust the height as needed
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/vecv2.jpg', // Replace with the actual path to your first image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                      const SizedBox(width: 16.0), // Add some spacing between the images
                      Image.asset(
                        'assets/images/pcp.png', // Replace with the actual path to your second image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0), // Add some spacing between the images and text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Refer to gain points and by completing project tasks.',
                      style: TextStyle(color: Colors.black, fontFamily: 'NexaRegular'),
                    ),
                  ),
                ],
              ),
            ),
            //box2
            Container(
              height: 150.0, // Adjust the height as needed
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/inn1.jpg', // Replace with the actual path to your first image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                      const SizedBox(width: 16.0), // Add some spacing between the images
                      Image.asset(
                        'assets/images/att3.png', // Replace with the actual path to your second image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Add some spacing between the images and text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Refer to do gain points by doing attendance and by innovation in which you can earn upto 40 points.',
                      style: TextStyle(color: Colors.black, fontFamily: 'NexaRegular'),
                    ),
                  ),
                ],
              ),
            ),
            //box3
            Container(
              height: 200.0, // Adjust the height as needed
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/td1.png', // Replace with the actual path to your first image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                      const SizedBox(width: 16.0), // Add some spacing between the images
                      Image.asset(
                        'assets/images/eca.jpg', // Replace with the actual path to your second image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0), // Add some spacing between the images and text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Refer to do gain points by doing training and development,and also by participating in extra curricular activities in which you can earn upto 40 points.',
                      style: TextStyle(color: Colors.black, fontFamily: 'NexaRegular'),
                    ),
                  ),
                ],
              ),
            ),
            //box4
            Container(
              height: 200.0, // Adjust the height as needed
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/inn1.jpg', // Replace with the actual path to your first image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                      const SizedBox(width: 16.0), // Add some spacing between the images
                      Image.asset(
                        'assets/images/vecv2.jpg', // Replace with the actual path to your second image asset
                        width: 150.0, // Adjust the width as needed
                        height: 80.0, // Adjust the height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0), // Add some spacing between the images and text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Gain points by innovative ideas and by doing performance in which you can earn upto 40 points.',
                      style: TextStyle(color: Colors.black, fontFamily: 'NexaRegular'),
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
