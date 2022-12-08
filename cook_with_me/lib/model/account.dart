class Account {
  String? sId;
  String? email;
  String? fullname;
  String? avatarLink;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Account(
      {this.sId,
      this.email,
      this.fullname,
      this.avatarLink,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Account.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fullname = json['fullname'];
    avatarLink = json['avatar_link'];
    role = json['role'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['fullname'] = fullname;
    data['avatar_link'] = avatarLink;
    data['role'] = role;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
