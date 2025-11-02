class LoginRequest{
  const LoginRequest({required this.deliveryNo,required this.password,this.languageNo=1});
  final int deliveryNo;
  final String password;
  final int languageNo;

  factory LoginRequest.fromJson(Map<String,dynamic> json)=>
      LoginRequest(deliveryNo: json["P_DLVRY_NO"]!, password: json["P_PSSWRD"]!, languageNo: json["P_LANG_NO"]!);

    Map<String, dynamic> toJson() =>{
      "P_DLVRY_NO": deliveryNo,
      "P_PSSWRD": password,
      "P_LANG_NO": languageNo,
    };

}