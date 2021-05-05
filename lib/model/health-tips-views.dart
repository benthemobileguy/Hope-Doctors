
class HealthTipViews {
  String segment;
  int view;

  HealthTipViews({this.segment, this.view});

  HealthTipViews.fromJson(Map<String, dynamic> json) {
    segment = json['segment'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['segment'] = this.segment;
    data['view'] = this.view;
    return data;
  }
}