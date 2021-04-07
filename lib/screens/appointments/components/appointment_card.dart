import 'package:flutter/material.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(
            color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Center(child: new Image.asset("images/card.png",height: 70,width: 6,)),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "09:00 AM",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lato',
                        color: greyColor2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CircularProfileAvatar(
                          profileURL,
                          //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                          radius: 10,
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
                          "Charles Okotie",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Lato',
                            color: greyColor2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                new Image.asset("images/call.png",
                  height: 30,width: 30,),
                SizedBox(
                  width: 20,
                ),
                new Image.asset("images/upcoming.png",
                  height: 30,width: 30,),
                SizedBox(
                  width: 20,
                ),
                new Image.asset("images/missed.png",
                  height: 30,width: 30,),
                SizedBox(
                  width: 20,
                ),
                new Image.asset("images/drop_down.png",
                  height: 30,width: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}