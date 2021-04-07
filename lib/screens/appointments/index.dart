import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:hope_doctor/widgets/main-button.dart';
class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
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
       body: Row(
         children: [
           Container(
             height: 45,
             width: 130,
             child: MainButton(
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
    );
  }
}
