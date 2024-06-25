import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String email;
  final String userName;
  String phone;
  String profilePicture;

  UserModel({required this.id, required this.email, required this.userName, required this.firstName,required this.lastName,required this.phone,required this.profilePicture});

  String get fullName =>'$firstName $lastName';

  String get formattedPhoneNo=>TFormatter.formatPhoneNumber(phone);

  static List<String> nameParts(fullName)=>fullName.split(" ");

  // Static method to generate username from full name
  static String generateUserName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName="$firstName$lastName";
    String userNameWithPrifix="cw_$camelCaseUserName";
    return userNameWithPrifix;
   
  }
  //Empty user model
  static UserModel empty() => UserModel(id: '', email: '', userName: '', firstName: '', lastName: '', phone: '', profilePicture: '');

  //Json format Structure for storing data in firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userName': userName,
      'phone': phone,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot <Map<String,dynamic>>document) {
    if(document.data()!=null){
      final data = document.data() as Map<String, dynamic>;
    return UserModel(
      id: document.id,
      email: data['email']??'',
      userName: data['userName']??'',
      firstName: data['firstName']??'',
      lastName: data['lastName']??'',
      phone: data['phone']??'',
      profilePicture: data['profilePicture']??'',
    );
    }else{
      return UserModel.empty();
    }
  }
}
