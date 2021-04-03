import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope_doctor/screens/appointments/index.dart';
import 'package:hope_doctor/screens/health-tips/index.dart';
import 'package:hope_doctor/screens/home/index.dart';
import 'package:hope_doctor/screens/messages/index.dart';
import 'package:hope_doctor/screens/patients/index.dart';
import 'package:hope_doctor/screens/shop/index.dart';

class Base extends StatefulWidget {
  final int currentIndex;
  Base({Key key, this.currentIndex}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BaseState();
  }
}

class _BaseState extends State<Base> {
  int _currentIndex = 0;

  final scaffoldKeyBase = new GlobalKey<ScaffoldState>();
  ifNotNull() {
    if (widget.currentIndex != null) {
      setState(() {
        _currentIndex = widget.currentIndex;
      });
    }
  }

  @override
  void initState() {
    ifNotNull();

    super.initState();
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext ctx) {
    List<Widget> _children = [
      new HomePage(),
      new AppointmentsScreen(),
      new MessagesScreen(),
      new PatientsScreen(),
      new HealthTipsScreen(),
      new ShopScreen()
    ];
    return new Scaffold(
      key: scaffoldKeyBase,
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14.0,
        fixedColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child:ImageIcon(
                  AssetImage(
                    "images/icons/home.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 10,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child:ImageIcon(
                  AssetImage(
                    _currentIndex!=1?
                    "images/icons/calendar.png"
                        :"images/icons/calendar_green.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Schedule",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 10,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle
                ),
                child: new SvgPicture.asset(
                  "images/pain_report.svg",
                )
            ),
            title: Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 10,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child:ImageIcon(
                  AssetImage(
                    _currentIndex!=3? "images/icons/profile.png":
                    "images/icons/profile_green.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 10,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child:ImageIcon(
                  AssetImage(
                    _currentIndex!=4? "images/icons/shop.png"
                        :"images/icons/shop_green.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Shop",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
