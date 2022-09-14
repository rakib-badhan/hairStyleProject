/*
    Created by Shitab Mir on 14 September 2022
 */
class SignupResponse {
  bool? success;
  String? message;
  MyData? data;

  SignupResponse({this.success, this.message, this.data});

  SignupResponse.fromJson(Map<String?, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? MyData.fromJson(json['data']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> map = <String?, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }

    return map;
  }
}

class MyData {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  MyData({this.name, this.email, this.updatedAt, this.createdAt, this.id});

  MyData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

/*
Expected Response
{
    "success": true,
    "message": "User created successfully",
    "data": {
        "name": "shitab22",
        "email": "shitab22",
        "updated_at": "2022-09-14T06:11:38.000000Z",
        "created_at": "2022-09-14T06:11:38.000000Z",
        "id": 32
    }
}
 */
