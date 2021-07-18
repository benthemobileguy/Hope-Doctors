import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/global-variables.dart';
class NewMessages extends StatelessWidget {
  final String messageType;
  final String name;
  final Function() onPressed;
  const NewMessages({
    Key key, this.messageType, this.name, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(7, 121, 101, 0.3), width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                    color: primaryColor, width: 1),
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child:   Text(
                "${messageType} message",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  "${name}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Lato',
                    color: greyColor2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                new Image.asset("images/message.png",
                  width: 30,height: 30,),

              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}