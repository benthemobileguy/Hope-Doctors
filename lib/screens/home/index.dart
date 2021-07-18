import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/model/health-tips-views.dart';
import 'package:hope_doctor/screens/home/base.dart';
import 'package:hope_doctor/screens/home/components/health-tip-view-component.dart';
import 'package:hope_doctor/screens/home/components/new-messages.dart';
import 'package:hope_doctor/screens/home/components/upcoming-appointments.dart';
import 'package:hope_doctor/screens/messages/chat-screen.dart';
import 'package:hope_doctor/screens/notes/index.dart';
import 'package:hope_doctor/services/authentication-service.dart';
import 'package:hope_doctor/shimmers/shimmer-home.dart';
import 'package:intl/intl.dart';
import 'package:hope_doctor/shimmers/shimmer-list-view.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:mdi/mdi.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:hope_doctor/widgets/main-button.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainBloc mainBloc;
  AuthenticationService authenticationService;
  bool isDataLoaded = false;
  bool isInitialised = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    authenticationService = new AuthenticationService(context: context);
    mainBloc = Provider.of<MainBloc>(context);
    if(!isInitialised){
      fetchNetworkRequests();
    }
    isInitialised = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bottomSheetBg.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          ImageIcon(
            AssetImage(
              "images/icons/search.png",
            ),
            color: HexColor("#505050"),
            size: 24,
          ),
          SizedBox(
            width: 30,
          ),
          ImageIcon(
            AssetImage(
              "images/icons/notification.png",
            ),
            color: HexColor("#505050"),
            size: 20,
          ),
          SizedBox(
            width: 30,
          ),
          Transform.scale(
            scale: 0.7,
            child: CircularProfileAvatar(
              profileURL,
              //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
              radius: 30,
              // sets radius, default 50.0
              backgroundColor: Colors.transparent,
              // sets background color, default Colors.white
              borderWidth: 2,
              // sets initials text, set your own style, default Text('')
              borderColor: Colors.white,
              // sets border color, default Colors.white
              elevation: 5.0,
              // sets elevation (shadow of the profile picture), default value is 0.0
              foregroundColor: Colors.brown.withOpacity(0.5),
              //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
              cacheImage: true,
              // allow widget to cache image against provided url
              onTap: () {
                print('adil');
              },
              // sets on tap
              showInitialTextAbovePicture:
                  true, // setting it true will show initials text above profile picture, default false
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${mainBloc.user.firstname} '
                    '${mainBloc.user.lastname}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Lato',
                  color: normalTextBold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Admin",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Lato',
                  color: normalTextBold,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
        title: Text(
          "Dashboard",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Lato',
            color: normalTextBold,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: !isDataLoaded?
      ShimmerHome():
      Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Text(
                              DateFormat('EEEE d, MMMM').format(DateTime.now()),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                color: greyColor2,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  totalPatients,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    color: greyColor2,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Patients",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    color: greyColor2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Stack(
                        children: [
                          mainBloc.currentAppointment!=null?  Positioned(
                            right: 0,
                            top: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "CURRENT TIME",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 50,
                                  width: 150,
                                  child: MainButton(
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "08:54",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            color: greyColor2,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            "AM",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              color: greyColor2,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "START TIME",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: MainButton(
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "08:00",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            color: greyColor2,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            "AM",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              color: greyColor2,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "END TIME",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: MainButton(
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "09:00",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            color: greyColor2,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            "AM",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              color: greyColor2,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ):
                          Container(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                mainBloc.currentAppointment!=null?
                                "Currently Attending":"No Current Appointments",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  CircularProfileAvatar(
                                    profileURL,
                                    //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                                    radius: 30,
                                    // sets radius, default 50.0
                                    backgroundColor: Colors.transparent,
                                    // sets background color, default Colors.white
                                    // sets initials text, set your own style, default Text('')
                                    borderColor: Colors.white,
                                    // sets border color, default Colors.white
                                    elevation: 5.0,
                                    // sets elevation (shadow of the profile picture), default value is 0.0
                                    foregroundColor: Colors.brown.withOpacity(0.5),
                                    //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                                    cacheImage: true,
                                    // allow widget to cache image against provided url
                                    onTap: () {
                                      print('adil');
                                    },
                                    // sets on tap
                                    showInitialTextAbovePicture:
                                    true, // setting it true will show initials text above profile picture, default false
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${mainBloc.user.firstname} "
                                        "${mainBloc.user.lastname}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              mainBloc.currentAppointment!=null?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "APPOINTMENT TYPE",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Initial Visit\n(Scan, Analysis, Adjustment)",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      color: ashGreen,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "N31,150",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ):Container(),
                              Row(
                                children: [
                                  mainBloc.upcomingAppointment!=null?Container(
                                    width: 170,
                                    height:50,
                                    child: MainButton(
                                      onPressed: () {},
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Mdi.check,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Done",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              color: primaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ):Container(),
                                  mainBloc.upcomingAppointment!=null?SizedBox(
                                    width: 16,
                                  ):Container(),
                                  Container(
                                    width: 170,
                                    height:50,
                                    child: MainButton(
                                      borderColor: Colors.white,
                                      disabledColor: Colors.white,
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context)
                                            => NotesScreen()));
                                      },
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          new Image.asset('images/notes.png',
                                            width: 30,height: 30,),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Take Notes",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Health Tips",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              color: greyColor2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                      HealthTipViewComponent(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reserved Products",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  color: greyColor2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                reservedProducts,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: greyColor2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TOTAL PRODUCTS",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Lato',
                                  color: greyColor2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                totalProducts,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  color: greyColor2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                    mainBloc.upcomingAppointment!=null?
                    Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Upcoming\nAppointments",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  color: greyColor2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: greyColor2, width: 1),
                                  color: greyColor2,
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Text(
                                  "View All",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          UpcomingCard(),
                          SizedBox(
                            height: 5,
                          ),
                          UpcomingCard(),
                          SizedBox(
                            height: 5,
                          ),
                          UpcomingCard(),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ):Container(),

                     mainBloc.messages!=null?
                     Column(
                       mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "New Messages",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    color: greyColor2,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context)
                                        => Base(currentIndex: 2,)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: greyColor2, width: 1),
                                      color: greyColor2,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Text(
                                      "View All",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),

                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return NewMessages(
                                 name: '${mainBloc.messages[index].senderId.firstname} '
                                     '${mainBloc.messages[index].senderId.lastname}',
                                  messageType: mainBloc.messages[index].type,
                                  onPressed: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)
                                        => ChatScreen()));
                                  },
                                );
                              },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ):Container(),
                    ],
                  ),

                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchNetworkRequests() async {
    mainBloc.fetchCurrentAppointment(context).then((value){
      print(value);
    });
    mainBloc.fetchUpcomingAppointment(context).then((value){
      print(value);
    });
    mainBloc.fetchMessages(context).then((value){

    });
    ///Stat
    authenticationService.fetchStat().then((value){
      setState(() {
        totalProducts = '${value["count"]["total_product"]}';
        reservedProducts = '${value["count"]["total_reserved_product"]}';
        totalPatients = '${value["count"]["total_patient"]}';
      });
    });
    ///Health tips views
    authenticationService.fetchHealthTipsViews().then((value){
      setState(() {
        healthTipViews = HealthTipViews.fromJsonList(value['healthTipViews']);
      });
    });

   Future.wait({
    mainBloc.fetchHealthTips(context),
   }).then((value) {
     setState(() {
       isDataLoaded = true;
     });
   });
  }
}





