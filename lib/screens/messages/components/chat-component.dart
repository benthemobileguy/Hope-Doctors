import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/global-variables.dart';
class ChatComponent extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  const ChatComponent({
    Key key, this.name, this.message, this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical:12 ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all
            (Radius.circular(8)),
          border: Border.all(color: Color.fromRGBO
            (80, 80, 80, 0.2), width: 1)
      ),
      child: Row(
        children: [

          CircularProfileAvatar(
            profileURL,
            //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
            radius: 25,
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
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      color: normalTextBold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: Text(
                      time,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Lato',
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                message,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.5,
                  fontFamily: 'Lato',
                  color: mildGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}