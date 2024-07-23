class User {
  String? fName;
  String? lName;
  String? email;
  String? phone;
  String? password;
  String? address;
  String? pan;
  String? msme;
  String? gst;
  String? profile;

  User(
      {this.fName,
      this.lName,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.pan,
      this.msme,
      this.gst,
      this.profile});

  User.fromJson(Map<String, dynamic> json) {
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    pan = json['pan'];
    msme = json['msme'];
    gst = json['gst'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['address'] = address;
    data['pan'] = pan;
    data['msme'] = msme;
    data['gst'] = gst;
    data['profile'] = profile;
    return data;
  }
}
