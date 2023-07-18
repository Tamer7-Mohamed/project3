import 'package:flutter/cupertino.dart';
import 'package:taam_app/utlis.dart';
class ArchivedTasksScreen extends StatefulWidget {
  @override
  _ArchivedTasksScreenState createState() => _ArchivedTasksScreenState();
}
class _ArchivedTasksScreenState extends State<ArchivedTasksScreen> {
  @override
  void initState() {
    super.initState();
    gettName();
  }
  String useremail='';
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(
         useremail,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 50,
          color: CupertinoColors.white
        ),
      ),);}
  gettName() async{
    useremail=await getName();
     setState(() {

     });
  }
}

