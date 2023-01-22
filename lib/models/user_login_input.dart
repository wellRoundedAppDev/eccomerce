class UserLoginInput{

  String username = "";
  String password = "";


  UserLoginInput({
    this.username="",
    this.password="",

});

  factory UserLoginInput.fromJson(Map<String, dynamic> json) => UserLoginInput(
    username: json["username"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,

  };
}