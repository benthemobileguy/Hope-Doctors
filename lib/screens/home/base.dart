import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope_doctor/screens/appointments/index.dart';
import 'package:hope_doctor/screens/health-tips/index.dart';
import 'package:hope_doctor/screens/home/index.dart';
import 'package:hope_doctor/screens/messages/index.dart';
import 'package:hope_doctor/screens/patients/index.dart';
import 'package:hope_doctor/screens/shop/index.dart';
import 'package:hope_doctor/theme/style.dart';

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
                    "images/icons/dashboard.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Dashboard",
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
                    "images/icons/appointment.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Appointments",
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
                    "images/icons/messages.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Messages",
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
                 "images/icons/patients.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Patients",
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
                    "images/icons/health_tips.png",
                  ),
                  size: 25,
                )
            ),
            title: Text(
              "Health Tips",
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
                    "images/icons/shop.png",
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
