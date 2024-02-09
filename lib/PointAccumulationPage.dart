import 'package:flutter/material.dart';

class PointAccumulationPage extends StatelessWidget {

  Color primary=const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point Accumulation',
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
                          offset: const Offset(0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0), // Add left margin here
                          child: Text(
                            '125',
                            style: TextStyle(
                              fontFamily: 'NexaBold',
                              fontSize: 28,
                              color: primary,
                            ),
                          ),
                        ),
                        const Text(
                          'You gained 125 points this month',
                          style: TextStyle(color: Colors.black, fontFamily: 'NexaRegular',fontSize: 15),
                        ),
                      ],
                    ),

                  ),
                ),

                // Rectangle Box 1
                const SizedBox(height: 16.0), // Add some space before the rectangle box
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
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
                const SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
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
                const SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
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
                const SizedBox(height: 8.0),
                Container(
                  height: 150.0,width: 400,// Adjust the height as needed
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
                      const SizedBox(height: 8.0), // Add some space between the image and text
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