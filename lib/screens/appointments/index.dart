import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/screens/appointments/components/appointment_card.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:hope_doctor/widgets/main-button.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  CalendarCarousel _calendarCarouselNoHeader;
  int slotIndex = -1;
  String selectedDate = '${DateFormat('EEEE d, MMMM yyyy').format(DateTime.now())}';
  MainBloc mainBloc;

  StateSetter dialogState;
  bool unavailableChecked = false;
  EventList<Event> _markedDateMap = new EventList<Event>();
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now().subtract(Duration(days: 100));
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.lime,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: textColor, width: 6.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      pageScrollPhysics: NeverScrollableScrollPhysics(),
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() {
          if (slotIndex != -1) {}
          slotIndex = -1;
          _currentDate2 = date;
          print(date.toString().substring(0, 10));
        });
        this.dialogState(() {
          if (slotIndex != -1) {}
          slotIndex = -1;
          _currentDate2 = date;
          selectedDate = '${DateFormat('EEEE d, MMMM yyyy').format(date)}';
          print(date.toString().substring(0, 10));
        });
        events.forEach((event) => print(event.title));
      },
      markedDateShowIcon: true,
      headerTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: normalText,
        fontWeight: FontWeight.w700,
      ),

      weekdayTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: normalText,
        fontWeight: FontWeight.w800,
      ),
      iconColor: normalText,
      markedDateCustomTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: normalText,
        fontWeight: FontWeight.w700,
      ),
      todayTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: normalText,
        fontWeight: FontWeight.w700,
      ),
      todayButtonColor: Colors.white,
      weekDayMargin: EdgeInsets.all(5),
      selectedDayBorderColor: primaryColor,
      selectedDayButtonColor: primaryColor,
      selectedDayTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: primaryColor, width: 2)),
      daysHaveCircularBorder: true,
      // showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: normalText,
        fontWeight: FontWeight.w800,
      ),
      thisMonthDayBorderColor: textRed,
      weekFormat: false,
      firstDayOfWeek: 4,
      // markedDatesMap: _markedDateMap!=null?_markedDateMap,
      height: 1100,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      daysTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: normalText,
        fontWeight: FontWeight.w700,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 1)),
      maxSelectedDate: _currentDate.add(Duration(days: 3600)),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
        this.dialogState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },

      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
    return Scaffold(
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
          "Health Tips",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Lato',
            color: normalTextBold,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 150,
                    child: MainButton(
                      onPressed: () {
                        setAvailability();
                      },
                      color: primaryColor,
                      borderColor: primaryColor,
                      child: Text(
                        "Set Availability",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 45,
                    width: 150,
                    child: MainButton(
                      onPressed: () {
                        setAvailability();
                      },
                      borderColor: primaryColor,
                      color: Colors.white,
                      child: Text(
                        "Edit Care Plans",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                        color: Color.fromRGBO(7, 121, 101, 0.3), width: 1)),
                child: _calendarCarouselNoHeader,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                mainBloc.currentAppointment != null
                    ? "Appointments Through The Day"
                    : "Appointments Through The Day (NONE)",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Lato',
                  color: greyColor2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              mainBloc.currentAppointment != null
                  ? AppointmentCard()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void setAvailability() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(

              builder: (
                  BuildContext context, StateSetter setState) {
                dialogState = setState;
                return  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Set Availability",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              color: normalTextBold,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 45,
                            width: 120,
                            child: MainButton(
                              onPressed: () {},
                              borderColor: primaryColor,
                              color: primaryColor,
                              child: Text(
                                "Save",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: 500,
                          width: 500,
                          child: _calendarCarouselNoHeader),
                      GestureDetector(
                        onTap: () {
                          dialogState(() {
                            unavailableChecked = !unavailableChecked;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: !unavailableChecked?
                            containerBgColor:primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(12)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Unavailable All Day Today",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  color: !unavailableChecked?
                                  textColor:Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            selectedDate,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              color: normalTextBold,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration:BoxDecoration(
                                color:lightGreenBg,
                                borderRadius: BorderRadius.all
                                  (Radius.circular(8))
                            ),
                            padding:EdgeInsets.all(12),
                            margin:EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "08:00am",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.5,
                                fontFamily: 'Lato',
                                color: normalTextBold,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            "-",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.5,
                              fontFamily: 'Lato',
                              color: normalTextBold,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            decoration:BoxDecoration(
                                color:lightGreenBg,
                                borderRadius: BorderRadius.all
                                  (Radius.circular(8))
                            ),
                            padding:EdgeInsets.all(12),
                            margin:EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "03:00pm",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.5,
                                fontFamily: 'Lato',
                                color: normalTextBold,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration:BoxDecoration(
                                color:lightGreenBg,
                                borderRadius: BorderRadius.all
                                  (Radius.circular(8))
                            ),
                            padding:EdgeInsets.all(12),
                            margin:EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Does Not Repeat",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    fontFamily: 'Lato',
                                    color: normalTextBold,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Icon(Icons.arrow_drop_down_outlined,
                                  color: normalTextBold,)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: MainButton(
                          onPressed: () {},
                          borderColor: Colors.white,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(
                                "Add Timeline",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  color: normalTextBold,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: FloatingActionButton(
                                    backgroundColor:
                                    primaryColor,
                                    tooltip: 'Toggle',
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ]);
              },
            ),
          );
        });
  }
}
