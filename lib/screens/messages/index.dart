import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/model/messages.dart';
import 'package:hope_doctor/screens/messages/components/chat-component.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:intl/intl.dart';
import 'package:hope_doctor/utils/links.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  MainBloc mainBloc;
  final timeAgoFormat = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z");
  List<Messages> fetchedMessages;

  int tabIndex = 0;
  bool isInitialised = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context);
    if(!isInitialised){
    networkRequest();
    }
    isInitialised = true;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
       appBar: AppBar(
         bottom: TabBar(
           onTap: (index){
             setState(() {
               fetchedMessages = null;
               tabIndex = index;
               networkRequest();
             });
           },
           isScrollable: true,
           indicatorSize: TabBarIndicatorSize.tab,
           labelColor: primaryColor,
           unselectedLabelColor: greyColor2,
           indicatorColor: primaryColor,
           tabs: [
             Tab(child:  Text(
               "Pain Report",
               textAlign: TextAlign.start,
               style: TextStyle(
                 fontSize: 14,
                 fontFamily: 'Lato',
                 fontWeight: FontWeight.w700,
               ),
             ),),
             Tab(child:  Text(
               "Reviews",
               textAlign: TextAlign.start,
               style: TextStyle(
                 fontSize: 14,
                 fontFamily: 'Lato',
                 fontWeight: FontWeight.w700,
               ),
             ),),
             Tab(child:  Text(
               "Complaint",
               textAlign: TextAlign.start,
               style: TextStyle(
                 fontSize: 14,
                 fontFamily: 'Lato',
                 fontWeight: FontWeight.w700,
               ),
             ),),
             Tab(child:  Text(
               "Missed Appointment",
               textAlign: TextAlign.start,
               style: TextStyle(
                 fontSize: 14,
                 fontFamily: 'Lato',
                 fontWeight: FontWeight.w700,
               ),
             ),),
           ],
         ),
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
          "Messages",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Lato',
            color: normalTextBold,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
        body: Column(
          children: [
           fetchedMessages==null?
           Expanded(
              child: Center(
                child: SpinKitRipple(
                  borderWidth: 8,
                  color: primaryColor,
                  size: 100.0,
                ),
              ),
            ):Container(),
            fetchedMessages!=null?
            Expanded(
              child: ListView.builder(
                      itemCount:  fetchedMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ChatComponent
                            (name: '${fetchedMessages[index].senderId.firstname} '
                              '${fetchedMessages[index].senderId.lastname}',
                            time: timeago.format(DateTime.parse(fetchedMessages[index].createdAt)),
                            profileUrl:  Links.cloudinaryLink+fetchedMessages[index].senderId.profilePhotoUrl,
                            message: '${fetchedMessages[index].message}',),
                        );
                      },
                    ),
            ):Container(),
          ],
        ),
      ),
    );
  }

  void networkRequest() {
    mainBloc.fetchMessages(context).then((value){
      setState(() {
        switch(tabIndex){
          case 0:
            fetchedMessages = mainBloc.messages.
            where((element) => element.type == "pain-in-the-body").toList();
            break;
          case 1:
            fetchedMessages = mainBloc.messages.
            where((element) => element.type == "leave-a-review").toList();
            break;
          case 2:
            fetchedMessages = mainBloc.messages.
            where((element) => element.type == "complaint").toList();
            break;
          case 3:
            fetchedMessages = mainBloc.messages.
            where((element) => element.type == "missed-appointment").toList();
            break;
        }
      });
    });
  }
}


