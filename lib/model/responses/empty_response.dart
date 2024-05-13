class EmptyResponse {
  bool? status;
  String? msg;
  int? code;

  EmptyResponse({this.status, this.msg, this.code});

  EmptyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['code'] = this.code;
    return data;
  }
}
