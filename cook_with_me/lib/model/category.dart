class Category {
  String? sId;
  String? name;
  String? description;
  String? imageCover;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Category(
      {this.sId,
      this.name,
      this.description,
      this.imageCover,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    imageCover = json['image_cover'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['image_cover'] = imageCover;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}