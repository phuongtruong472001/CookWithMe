

import 'package:cook_with_me/model/category.dart';

class Post {
  String? sId;
  Author? author;
  String? title;
  String? imageCover;
  List<Steps>? steps;
  List<Ingredients>? ingredients;
  String? videoLink;
  List<Category>? categories;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Post(
      {this.sId,
      this.author,
      this.title,
      this.imageCover,
      this.steps,
      this.ingredients,
      this.videoLink,
      this.categories,
      this.createdAt,
      this.updatedAt,
      this.iV});

  // Post.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   author =
  //       json['author'] != null ?  Author.fromJson(json['author']) : null;
  //   title = json['title'];
  //   imageCover = json['image_cover'];
  //   if (json['steps'] != null) {
  //     steps = <Steps>[];
  //     json['steps'].forEach((v) {
  //       steps!.add( Steps.fromJson(v));
  //     });
  //   }
  //   if (json['ingredients'] != null) {
  //     ingredients = <Ingredients>[];
  //     json['ingredients'].forEach((v) {
  //       ingredients!.add( Ingredients.fromJson(v));
  //     });
  //   }
  //   videoLink = json['video_link'];
  //   if (json['categories'] != null) {
  //     categories = [];
  //     json['categories'].forEach((v) {
  //       categories!.add( [].fromJson(v));
  //     });
  //   }
  //   createdAt = json['createdAt'];
  //   updatedAt = json['updatedAt'];
  //   iV = json['__v'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data['_id'] = sId;
  //   if (author != null) {
  //     data['author'] = author!.toJson();
  //   }
  //   data['title'] = title;
  //   data['image_cover'] = imageCover;
  //   if (steps != null) {
  //     data['steps'] = steps!.map((v) => v.toJson()).toList();
  //   }
  //   if (ingredients != null) {
  //     data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
  //   }
  //   data['video_link'] = videoLink;
  //   if (categories != null) {
  //     data['categories'] = categories!.map((v) => v.toJson()).toList();
  //   }
  //   data['createdAt'] = createdAt;
  //   data['updatedAt'] = updatedAt;
  //   data['__v'] = iV;
  //   return data;
  // }
}

class Author {
  String? sId;
  String? email;
  String? fullname;
  String? avatarLink;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Author(
      {this.sId,
      this.email,
      this.fullname,
      this.avatarLink,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Author.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
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

class Steps {
  String? name;
  String? description;
  String? imageLink;
  String? sId;

  Steps({name, description, imageLink, sId});

  Steps.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageLink = json['image_link'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['image_link'] = imageLink;
    data['_id'] = sId;
    return data;
  }
}

class Ingredients {
  String? name;
  String? unit;
  int? quantity;
  String? sId;

  Ingredients({name, unit, quantity, sId});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unit = json['unit'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['unit'] = unit;
    data['quantity'] = quantity;
    data['_id'] = sId;
    return data;
  }
}