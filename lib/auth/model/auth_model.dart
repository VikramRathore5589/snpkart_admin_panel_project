class AuthModel {
  //Declare variables
 final String username;
 final  String password;
//Constructor
  AuthModel({required this.username, required this.password});
//toJson Function
  Map<String, dynamic> toJson() {
    return {'username':username , 'password': password};
  }
//fromJson Function
  static AuthModel fromJson(Map<String, dynamic> map) {
    return AuthModel(username: map['username'], password: map['password']);
  }
}
