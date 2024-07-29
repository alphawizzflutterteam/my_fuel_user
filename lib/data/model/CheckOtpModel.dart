class CheckOtpNodel {
  bool? status;
  String? message;
  String? token;
  int? resendTime;
  String? otp;

  CheckOtpNodel({
    this.status,
    this.message,
    this.token,
    this.resendTime,
    this.otp,
  });

  CheckOtpNodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    resendTime = json['resend_time'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    data['resend_time'] = this.resendTime;
    data['otp'] = this.otp;

    return data;
  }
}
