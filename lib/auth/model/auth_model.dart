class AuthModel {
  //Declare variables
 final String email;
 final  String password;
//Constructor
  AuthModel({required this.email, required this.password});
//toJson Function
  Map<String, dynamic> toJson() {
    return {'email':email , 'password': password};
  }
//fromJson Function
  static AuthModel fromJson(Map<String, dynamic> map) {
    return AuthModel(email: map['email'], password: map['password']);
  }
}
