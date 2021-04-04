import 'package:flutter/material.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:mdi/mdi.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:hope_doctor/widgets/main-button.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bottomSheetBg.withOpacity(0.4),
     appBar: AppBar(
       backgroundColor: Colors.white,
       actions: [
         ImageIcon(
           AssetImage("images/icons/search.png",),
           color: HexColor("#505050"),
           size: 24,
         ),
         SizedBox(
           width: 30,
         ),
         ImageIcon(
           AssetImage("images/icons/notification.png",),
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
             showInitialTextAbovePicture: true, // setting it true will show initials text above profile picture, default false
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)),

                    ),
                    child: Text(
                      "Monday 14th, March",
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
                      border: Border.all(color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)),

                    ),
                    child: Text(
                      "Monday 14th, March",
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
                Text(
                  "Upcoming Appointments",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
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
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)),

                  ),
                  child: Text(
                    "View All",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
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
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                color: primaryColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(8)),

              ),
              child:  Stack(
                children: [
                  Positioned(
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
                            onPressed: (){

                            },
                            color: Colors.white,
                            child:  Row(
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
                          height: 16,
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
                            onPressed: (){

                            },
                            color: Colors.white,
                            child:  Row(
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
                          height: 16,
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
                            onPressed: (){

                            },
                            color: Colors.white,
                            child:  Row(
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
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Currently Attending",
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
                            showInitialTextAbovePicture: true, // setting it true will show initials text above profile picture, default false
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Kendrick Zacari",
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
                      Container(
                        width: 150,
                        child: MainButton(
                          onPressed: (){

                          },
                          color: Colors.white,
                          child:  Row(
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(8)),

              ),
              child:  Column(
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
                    height: 20,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
