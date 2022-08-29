/*
    Created by Shitab Mir on 21 August 2022
 */
class LoginResponse {
  bool? success;
  String? token;
  String? token_type;

  LoginResponse({this.success, this.token, this.token_type});

  LoginResponse.fromJson(Map<String?, dynamic> json) {
    success = json['success'];
    token = json['token'];
    token_type = json['token_type'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> map = <String?, dynamic>{};
    map['success'] = this.success;
    map['token'] = this.token;
    map['token_type'] = this.token_type;

    return map;
  }
}

/*
Expected Response
{
    "success": true,
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvaGFpcnN0eWxlLmxvdWlkZWNvci5jb21cL3B1YmxpY1wvYXBpXC9sb2dpbiIsImlhdCI6MTY2MTc4NDcyOCwiZXhwIjoxNjkzMzIwNzI4LCJuYmYiOjE2NjE3ODQ3MjgsImp0aSI6Imd2cUJuNzBHdE1manFIb3QiLCJzdWIiOjI1LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.owYkAiPBsmjgFTa7BfZViZYXbM0LL8y20cYz9MXyTJM",
    "token_type": "Bearer "
}
 */
