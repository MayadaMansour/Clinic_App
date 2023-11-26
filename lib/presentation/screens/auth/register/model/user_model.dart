class UserModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? uId;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.uId,
  });


  UserModel.fromJson(Map<String,dynamic> json){
    name=json["name"];
    email=json["email"];
    phone=json["phone"];
    password=json["password"];
    uId=json["uId"];
  }


  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "email":email,
      "phone":phone,
      "password":password,
      "uId":uId,

    };

  }
}
