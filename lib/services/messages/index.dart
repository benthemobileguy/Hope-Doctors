import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/model/messages.dart';
import 'package:hope_doctor/services/index.dart';
import 'package:provider/provider.dart';

class  MessagesService extends ApiService {
  BuildContext context;
  MainBloc bloc;

  MessagesService({@required this.context}) : super(context: context);


  /// get messages
  Future<List<Messages>> getMessages() async {
    bloc = Provider.of<MainBloc>(context, listen: false);
    Map<String, dynamic> _data =
    await get('message');
    print(_data);
    List<Messages> _messages;
    _messages =Messages.fromJsonList(_data['data']['data']);
    bloc.messages = _messages;
    return _messages;
  }

}