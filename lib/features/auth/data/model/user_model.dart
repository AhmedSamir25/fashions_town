class UserModel {
  String? name;
  String? email;
  String? userId;
  String? adress;
  int? phoneNumber;  
  UserModel({required this.email, required this.name, required this.userId,
   required this.adress, required this.phoneNumber});
  UserModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    userId = data['userId'];
    adress = data['adress'];
    phoneNumber = data['phoneNumber'];
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'userId': userId,
      'phoneNumber': phoneNumber,
      'adress': adress,
    };
  }
}