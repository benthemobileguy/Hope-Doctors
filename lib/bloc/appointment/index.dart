import 'package:flutter/material.dart';
import 'package:hope_doctor/model/current-appointment.dart';
import 'package:hope_doctor/model/date-slots.dart';
import 'package:hope_doctor/model/days-left-count.dart';
import 'package:hope_doctor/model/health-tips.dart';
import 'package:hope_doctor/model/message.dart';
import 'package:hope_doctor/model/next-appointment.dart';
import 'package:hope_doctor/model/plans.dart';
import 'package:hope_doctor/model/upcoming-appointment-count.dart';
import 'package:hope_doctor/model/upcoming-appointment.dart';
import 'package:hope_doctor/services/appointment/index.dart';

class AppointmentBloc extends ChangeNotifier {
  NextAppointment _nextAppointment;
  DaysLeftCount _daysLeftCount;
  List<Plans> _plans;
  List<Message> _message;
  List<HealthTips> _healthTips;
  List<Dateslots> _dateSlots;
  UpcomingAppointmentCount _upcomingAppointmentCount;
  CurrentAppointment _currentAppointment;
  UpcomingAppointment _upcomingAppointment;
  UpcomingAppointmentCount get upcomingAppointmentCount {
    return _upcomingAppointmentCount;
  }
  List<Message> get message {
    return _message;
  }
  set message(List<Message> _data) {
    this._message = _data;
    notifyListeners();
  }
  set healthTips(List<HealthTips> _data) {
    this._healthTips = _data;
    notifyListeners();
  }
  set dateSlots(List<Dateslots> _data) {
    this._dateSlots = _data;
    notifyListeners();
  }
  set plans(List<Plans> _data) {
    this._plans = _data;
    notifyListeners();
  }
  List<HealthTips> get healthTips {
    return _healthTips;
  }

  List<Plans> get plans {
    return _plans;
  }
  List<Dateslots> get dateSlots {
    return _dateSlots;
  }
  set upcomingAppointmentCount(UpcomingAppointmentCount _data) {
    this._upcomingAppointmentCount = _data;
    notifyListeners();
  }
  CurrentAppointment get currentAppointment {
    return _currentAppointment;
  }

  set currentAppointment(CurrentAppointment _data) {
    this._currentAppointment = _data;
    notifyListeners();
  }

  UpcomingAppointment get upcomingAppointment {
    return _upcomingAppointment;
  }
  set upcomingAppointment(UpcomingAppointment _data) {
    this._upcomingAppointment = _data;
    notifyListeners();
  }
  set nextAppointment(NextAppointment _data) {
    this._nextAppointment = _data;
    notifyListeners();
  }

  NextAppointment get nextAppointment {
    return _nextAppointment;
  }

  DaysLeftCount get daysLeftCount {
    return _daysLeftCount;
  }

  set daysLeftCount(DaysLeftCount _data) {
    this._daysLeftCount = _data;
    notifyListeners();
  }
  ///fetch next appointment
  Future<NextAppointment> fetchNextAppointment(BuildContext context) async {
    AppointmentService appointmentService = new AppointmentService(
        context: context);
    NextAppointment _nextAppointment= await appointmentService.getNextAppointment();
    this._nextAppointment = _nextAppointment;
    notifyListeners();
    return _nextAppointment;
  }
  ///fetch upcoming appointment count
  Future<UpcomingAppointmentCount> fetchUpcomingAppointmentCount(BuildContext context) async {
    AppointmentService appointmentService = new  AppointmentService(
        context: context);
    UpcomingAppointmentCount _upcomingAppointment = await appointmentService.getUpcomingAppointmentCount();
    this._upcomingAppointmentCount = _upcomingAppointment;
    notifyListeners();
    return _upcomingAppointment;
  }
  ///fetch upcoming appointment
  Future<UpcomingAppointment> fetchUpcomingAppointment(BuildContext context) async {
    AppointmentService appointmentService = new  AppointmentService(
        context: context);
    UpcomingAppointment _upcomingAppointment = await appointmentService.getUpcomingAppointment();
    this._upcomingAppointment = _upcomingAppointment;
    notifyListeners();
    return _upcomingAppointment;
  }

  ///fetch current appointment
  Future<CurrentAppointment> fetchCurrentAppointment(BuildContext context) async {
    AppointmentService appointmentService = new  AppointmentService(
        context: context);
    CurrentAppointment _currentAppointment = await appointmentService.getCurrentAppointment();
    this._currentAppointment = _currentAppointment;
    notifyListeners();
    return _currentAppointment;
  }
  ///fetch days left count
  Future<DaysLeftCount> fetchDaysLeftCount(BuildContext context) async {
    AppointmentService appointmentService = new  AppointmentService(
        context: context);
    DaysLeftCount _daysLeftCount= await appointmentService.getDaysLeftCount();
    this._daysLeftCount = _daysLeftCount;
    notifyListeners();
    return _daysLeftCount;
  }

  ///fetch health Tips
  Future<List<HealthTips>> fetchHealthTips(BuildContext context) async {
    AppointmentService appointmentService = new  AppointmentService(
        context: context);
    List<HealthTips> _healthTips= await appointmentService.getHealthTips();
    this._healthTips= _healthTips;
    notifyListeners();
    return _healthTips;
  }
  ///fetch plans
  Future<List<Plans>> fetchPlans(BuildContext context) async {
    AppointmentService appointmentService = new  AppointmentService(
        context: context);
    List<Plans> _plans = await appointmentService.getPlans();
    this._plans= _plans;
    notifyListeners();
    return _plans;
  }
  ///fetch date slots
  Future<List<Dateslots>> fetchDateSlots(BuildContext context) async {
    AppointmentService appointmentService = new  AppointmentService(
        context: context);
    List<Dateslots> _dateSlots = await appointmentService.getDateSlots();
    this._dateSlots= _dateSlots;
    notifyListeners();
    return _dateSlots;
  }
}
