class Postmodeldata {
  String? response;
  bool? error;
  String? message;

  Postmodeldata({this.response, this.error, this.message});

  Postmodeldata.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
