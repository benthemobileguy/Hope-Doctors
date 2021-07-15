import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/model/message.dart';
import 'package:hope_doctor/model/messages.dart';
import 'package:hope_doctor/screens/components/main-button.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bubble/bubble.dart';
import 'package:hope_doctor/utils/alert-manager.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:hope_doctor/services/appointment/index.dart';
class ChatScreen extends StatefulWidget {
  final Messages messages;
  const ChatScreen({Key key, this.messages}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  MainBloc mainBloc;
  ScrollController _scrollController = new ScrollController();

  String messageType = "";
  int msgTypeIndex = -1;
  AppointmentService appointmentService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appointmentService = new AppointmentService(context: context);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: lightGreen,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: bubbleMsg,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Message",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Lato',
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
          color: textColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded (
              child: ListView(
                controller: _scrollController,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: messageController,
                      cursorColor: textColor,
                      decoration: InputDecoration(
                          fillColor: containerBgColor,
                          filled: true,
                          hintStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Lato',
                            color: textColor,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0)),
                          hintText: 'Type your message here'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonTheme(
                  minWidth: 48,
                  height: 50,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0),
                    color: primaryColor,
                    onPressed: () {
                      if (messageController.text != "") {

                      }
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(16)),
                    child: Image.asset(
                      'images/send.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendMessage() async {
    print(messageController.text);
    Navigator.pop(context);
    Map<String, dynamic> data = new Map();
    data = {
      "type": messageType,
      "receiver_id": 16,
      "message": messageController.text
    };
    Map<String, dynamic> _res = await appointmentService.sendMessage(data);
    if (_res["status"] == "success") {
      setState(() {
        mainBloc.message.add(Message(type: messageType, message: messageController.text));
        msgTypeIndex = -1;
      });
      messageController.clear();
    }
  }

}
