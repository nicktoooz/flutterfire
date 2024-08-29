import 'package:flutterfire/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const String tableName = "users";

const f_uid = "_id";
const f_email = "email";
const f_password = "password";

const List<String> userColumns = [f_uid, f_email, f_password];

class User {
  String? uid;
  String? email;
  String? password;

  User({this.uid, required this.email, required this.password});

  static User fromJson(Map<String, dynamic> json) => User(
      uid: json[f_uid] as String?,
      email: json[f_email] as String,
      password: json[f_password] as String);

  Map<String, dynamic> toJson() =>
      {f_uid: uid, f_email: email, f_password: password};

  User copyWith({String? uid, String? email, String? password}) => User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password);
}
