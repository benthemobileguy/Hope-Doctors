import 'package:flutter/material.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:hope_doctor/utils/global-variables.dart';
class HealthTipsScreen extends StatefulWidget {
  @override
  _HealthTipsScreenState createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical:12 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all
                        (Radius.circular(8)),
                      border: Border.all(color: Color.fromRGBO
                        (7, 121, 101, 0.8), width: 1)
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TITLE",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Back Pain",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Lato',
                          color: normalTextBold,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "VIEWS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Lato',
                              color: darkerText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "MEDIA",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Lato',
                              color: darkerText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "32",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.5,
                              fontFamily: 'Lato',
                              color: greyColor2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 44,
                          ),
                          Text(
                            "6 FILES",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.5,
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
                  width: 20,
                ),
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical:12 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all
                        (Radius.circular(8)),
                      border: Border.all(color: Color.fromRGBO
                        (7, 121, 101, 0.8), width: 1)
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TITLE",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Back Pain",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Lato',
                          color: normalTextBold,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "VIEWS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Lato',
                              color: darkerText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "MEDIA",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Lato',
                              color: darkerText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "32",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.5,
                              fontFamily: 'Lato',
                              color: greyColor2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 44,
                          ),
                          Text(
                            "6 FILES",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.5,
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
                  width: 20,
                ),
                Container(
                  width: 160,
                  height: 130,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical:12 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all
                        (Radius.circular(8)),
                      border: Border.all(color: Color.fromRGBO
                        (7, 121, 101, 0.8), width: 1)
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image.asset("images/add_circle.png",
                        width: 64,
                        height: 64,),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "ADD NEW",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
