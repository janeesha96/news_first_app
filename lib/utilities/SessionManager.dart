//import 'dart:convert';

// import 'package:axle/model/TabScreenPaths.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class SessionManager {
 

//   Future setUser(var value) async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.setString("user", value);
//   }

//   Future<User> getUser() async {
//     var prefs = await SharedPreferences.getInstance();
//     var value = prefs.getString("user") ?? '';
//     if (value.isEmpty) {
//       return null;
//     } else {
//       Map<String, dynamic> map = jsonDecode(value);
//       var user = User.fromJson(map);
//       return user;
//     }
//   }

//   Future deleteUser() async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.remove('user');
//   }
// }
