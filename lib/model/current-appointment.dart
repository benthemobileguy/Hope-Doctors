
class CurrentAppointment {
  int id;
  int userId;
  int planId;
  int dateslotId;
  int timeslotId;
  int completed;
  int softDelete;
  String createdAt;
  String updatedAt;
  User user;
  Dateslot dateslot;
  Timeslot timeslot;

  CurrentAppointment(
      {this.id,
        this.userId,
        this.planId,
        this.dateslotId,
        this.timeslotId,
        this.completed,
        this.softDelete,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.dateslot,
        this.timeslot});

  CurrentAppointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    planId = json['plan_id'];
    dateslotId = json['dateslot_id'];
    timeslotId = json['timeslot_id'];
    completed = json['completed'];
    softDelete = json['soft_delete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    dateslot = json['dateslot'] != null
        ? new Dateslot.fromJson(json['dateslot'])
        : null;
    timeslot = json['timeslot'] != null
        ? new Timeslot.fromJson(json['timeslot'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['plan_id'] = this.planId;
    data['dateslot_id'] = this.dateslotId;
    data['timeslot_id'] = this.timeslotId;
    data['completed'] = this.completed;
    data['soft_delete'] = this.softDelete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.dateslot != null) {
      data['dateslot'] = this.dateslot.toJson();
    }
    if (this.timeslot != null) {
      data['timeslot'] = this.timeslot.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String firstname;
  String lastname;
  String phoneNumber;
  String email;
  String dob;
  String profilePhotoUrl;
  Null referral;
  String role;
  Null fcmToken;
  Null deviceId;
  String createdAt;
  String updatedAt;
  String accountType;
  String createdAtForHumans;

  User(
      {this.id,
        this.firstname,
        this.lastname,
        this.phoneNumber,
        this.email,
        this.dob,
        this.profilePhotoUrl,
        this.referral,
        this.role,
        this.fcmToken,
        this.deviceId,
        this.createdAt,
        this.updatedAt,
        this.accountType,
        this.createdAtForHumans});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    dob = json['dob'];
    profilePhotoUrl = json['profile_photo_url'];
    referral = json['referral'];
    role = json['role'];
    fcmToken = json['fcm_token'];
    deviceId = json['device_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountType = json['account_type'];
    createdAtForHumans = json['created_at_for_humans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['referral'] = this.referral;
    data['role'] = this.role;
    data['fcm_token'] = this.fcmToken;
    data['device_id'] = this.deviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_type'] = this.accountType;
    data['created_at_for_humans'] = this.createdAtForHumans;
    return data;
  }
}

class Dateslot {
  int id;
  String date;
  int booked;
  String dateTrack;

  Dateslot({this.id, this.date, this.booked, this.dateTrack});

  Dateslot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    booked = json['booked'];
    dateTrack = json['date_track'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['booked'] = this.booked;
    data['date_track'] = this.dateTrack;
    return data;
  }
}

class Timeslot {
  int id;
  int dateSlotId;
  String startTime;
  String endTime;
  int booked;
  String createdAt;
  String updatedAt;

  Timeslot(
      {this.id,
        this.dateSlotId,
        this.startTime,
        this.endTime,
        this.booked,
        this.createdAt,
        this.updatedAt});

  Timeslot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateSlotId = json['date_slot_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    booked = json['booked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_slot_id'] = this.dateSlotId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['booked'] = this.booked;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}