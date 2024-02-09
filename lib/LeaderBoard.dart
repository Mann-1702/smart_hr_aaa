import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Leaderboard:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          //expansion tiles
          SizedBox(height: 16.0),
          // Example of an ExpansionTile
          ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/prf.png'),
                ),
                SizedBox(width: 10), // Adjust the spacing between the avatar and the title as needed
                Text('David'),
              ],
            ),
            children: [
              // Your content for Category 1
              ListTile(
                title: Text('David got the first rank for the employee of the month'),
              ),
            ],
          ),
          //exp2
          SizedBox(height: 16.0),
          // Example of an ExpansionTile
          ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/mnprf.png'),
                ),
                SizedBox(width: 10), // Adjust the spacing between the avatar and the title as needed
                Text('Mann'),
              ],
            ),
            children: [
              // Your content for Category 1
              ListTile(
                title: Text('Mann got the second rank for this company regardin best performance and attendance'),
              ),
            ],
          ),
          //exp3
          SizedBox(height: 16.0),
          // Example of an ExpansionTile
          ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/prf2.png'),
                ),
                SizedBox(width: 10), // Adjust the spacing between the avatar and the title as needed
                Text('Vrund'),
              ],
            ),
            children: [
              // Your content for Category 1
              ListTile(
                title: Text('Vrund got the third rank for the perfomance and innovation ideas'),
              ),
            ],
          ),
          //exp4
          SizedBox(height: 16.0),
          // Example of an ExpansionTile
          ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/prf3.png'),
                ),
                SizedBox(width: 10), // Adjust the spacing between the avatar and the title as needed
                Text('Jack'),
              ],
            ),
            children: [
              // Your content for Category 1
              ListTile(
                title: Text('Jack get rewards regarding traininig and extra ciricuilar activites.'),
              ),
            ],
          ),
          //exp5
          SizedBox(height: 16.0),
          // Example of an ExpansionTile
          ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/prf4.png'),
                ),
                SizedBox(width: 10), // Adjust the spacing between the avatar and the title as needed
                Text('Mark'),
              ],
            ),
            children: [
              // Your content for Category 1
              ListTile(
                title: Text('mark get the rewards regarding the attendance and project work in this firm.'),
              ),
            ],
          ),
          //exp6
          SizedBox(height: 16.0),
          // Example of an ExpansionTile
          ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/chprf.png'),
                ),
                SizedBox(width: 10), // Adjust the spacing between the avatar and the title as needed
                Text('Chirag'),
              ],
            ),
            children: [
              // Your content for Category 1
              ListTile(
                title: Text('Chirag get rewards for the innovation ideas and performance in this tech company.'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
