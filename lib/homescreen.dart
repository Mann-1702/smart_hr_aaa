import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_hr_aaa/calendarscreen.dart';
import 'package:smart_hr_aaa/profilescreen.dart';
import 'package:smart_hr_aaa/todayscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenHeight=0;
  double screenWidth=0;


  Color primary=const Color(0xffeef444c);

  int currentIndex = 1;

  List<IconData> navigationIcons = [
    FontAwesomeIcons.calendarDays,
    FontAwesomeIcons.check,
    FontAwesomeIcons.userLarge,
  ];

  // @override
  // void initState() {
  //   super.initState();
  //
  //   getID();
  //
  //
  // }

  // void getID() async {
  //   QuerySnapshot snap = await FirebaseFirestore.instance
  //       .collection('employee')
  //       .where('id', isEqualTo: User.employeeid)
  //       .get();
  //
  //
  //   setState(() {
  //     User.id = snap.docs[0].id;
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    screenHeight=MediaQuery.of(context).size.height;
    screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          CalendarScreen(),
          TodayScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 24,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child:  ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0; i<navigationIcons.length; i++)...<Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex=i;
                      });
                    },
                    child: Container(
                      height: screenHeight,
                      width: screenWidth,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              navigationIcons[i],
                              color: i == currentIndex ? primary : Colors.black54,
                              size: i == currentIndex ? 27 : 22,
                            ),
                            i == currentIndex ? Container(
                              margin: EdgeInsets.only(top: 6),
                              height: 3,
                              width: 19,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(40)),
                                color: primary,
                              ),
                            ) : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
