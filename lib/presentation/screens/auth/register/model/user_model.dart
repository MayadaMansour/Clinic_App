class UserModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? uId;
  bool? isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.uId,
    this.isEmailVerified
  });


  UserModel.fromjson(Map<String, dynamic> json){
    name=json["name"];
    email=json["email"];
    phone=json["phone"];
    password=json["password"];
    uId=json["uId"];
    isEmailVerified=json["isEmailVerified"];
  }


  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "email":email,
      "phone":phone,
      "password":password,
      "uId":uId,
      "isEmailVerified":isEmailVerified,

    };

  }
}
