//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_hr_aaa/LeaderBoard.dart';
import 'package:smart_hr_aaa/MyRewards.dart';
import 'package:smart_hr_aaa/LeaderBoard.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('REWARDS',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.wallet_giftcard_rounded,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
                child:TabBarView(children:[
                  //myrewards
                  MyRewards(),
                  //leaderboard
                  LeaderBoard(),
                ])
            )
          ],
        ),
      ),
    );
  }
}
