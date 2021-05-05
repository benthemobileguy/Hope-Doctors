import 'package:flutter/material.dart';
import 'package:hope_doctor/model/date-slots.dart';
import 'package:hope_doctor/model/days-left-count.dart';
import 'package:hope_doctor/model/health-tips.dart';
import 'package:hope_doctor/model/messages.dart';
import 'package:hope_doctor/model/next-appointment.dart';
import 'package:hope_doctor/model/plans.dart';
import 'package:hope_doctor/model/upcoming-appointment-count.dart';
import 'package:hope_doctor/services/appointment/index.dart';
import 'package:hope_doctor/services/messages/index.dart';

class MessagesBloc extends ChangeNotifier {

  List<Messages> _messages;


  List<Messages> get messages {
    return _messages;
  }
  set messages(List<Messages> _data) {
    this._messages = _data;
    notifyListeners();
  }

  ///fetch messages
  Future<List<Messages>> fetchMessages(BuildContext context) async {
     MessagesService messagesService = new  MessagesService(
        context: context);
    List<Messages> _messages = await messagesService.getMessages();
    this._messages= _messages;
    notifyListeners();
    return _messages;
  }
}
