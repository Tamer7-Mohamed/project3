import 'package:shared_preferences/shared_preferences.dart';

Future<String> getName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email')?? "";
}