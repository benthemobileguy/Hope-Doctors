import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/screens/appointments/components/appointment_card.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:hope_doctor/widgets/main-button.dart';
class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  CalendarCarousel  _calendarCarouselNoHeader;
  int slotIndex = -1;
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
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      pageScrollPhysics: NeverScrollableScrollPhysics(),
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() {
          if(slotIndex != -1){

          }
          slotIndex = -1;
          _currentDate2 = date;
          print(date.toString().substring(0,10));
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
      selectedDayTextStyle:  TextStyle(
        fontSize: 16,
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      markedDateCustomShapeBorder: CircleBorder(
          side: BorderSide(color: primaryColor, width: 2)
      ),
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
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
     height: 550,
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
              "Onuoha Okigwe",
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
                     width: 130,
                     child: MainButton(
                       onPressed: (){

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
                     width: 130,
                     child: MainButton(
                       onPressed: (){

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
                 padding: EdgeInsets.symmetric(horizontal: 12, vertical:12 ),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all
                       (Radius.circular(8)),
                     border: Border.all(color: Color.fromRGBO
                       (7, 121, 101, 0.3), width: 1)
                 ),
                 child: _calendarCarouselNoHeader,
               ),
               SizedBox(
                 height: 20,
               ),
               Text(
                 "Appointments Through The Day",
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
              AppointmentCard(),
               SizedBox(
                 height: 5,
               ),
               AppointmentCard(),
               SizedBox(
                 height: 5,
               ),
               AppointmentCard(),
               SizedBox(
                 height: 5,
               ),
               AppointmentCard(),
               SizedBox(
                 height: 5,
               ),
             ],
           ),
         ),
       ),
    );
  }
}
