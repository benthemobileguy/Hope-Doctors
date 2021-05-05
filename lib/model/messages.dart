
class Messages {
  int id;
  SenderId senderId;
  SenderId receiverId;
  String type;
  String message;
  String createdAt;
  String updatedAt;
  Messages(
      {this.id,
        this.senderId,
        this.receiverId,
        this.type,
        this.message,
        this.createdAt,
        this.updatedAt});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'] != null
        ? new SenderId.fromJson(json['sender_id'])
        : null;
    receiverId = json['receiver_id'] != null
        ? new SenderId.fromJson(json['receiver_id'])
        : null;
    type = json['type'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.senderId != null) {
      data['sender_id'] = this.senderId.toJson();
    }
    if (this.receiverId != null) {
      data['receiver_id'] = this.receiverId.toJson();
    }
    data['type'] = this.type;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  static List<Messages> fromJsonList(List<dynamic> _list) {
    return _list.map((_msgs) => Messages.fromJson(_msgs)).toList();
  }
}

class SenderId {
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

  SenderId(
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

  SenderId.fromJson(Map<String, dynamic> json) {
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

class Link {
  String url;
  String label;
  bool active;

  Link({this.url, this.label, this.active});

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}