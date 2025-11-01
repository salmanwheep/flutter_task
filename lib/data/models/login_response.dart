class LoginResponse{
  const LoginResponse({required userId,required body}):_body=body,_userId=userId;
  final int _userId;
  final String _body;

  int get userId => _userId ;
  String get body => _body ;
  factory LoginResponse.fromJson(Map<String,dynamic> json)=>
      LoginResponse(userId: json["P_DLVRY_NO"]!, body: json["body"]!);

  Map<String, dynamic> toJson() =>{
    "P_DLVRY_NO": _userId,
    "body": _body
  };

}