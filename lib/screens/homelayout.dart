import 'package:flutter/material.dart';
import 'package:taam_app/screens/archived.dart';
import 'package:taam_app/screens/donetaskes.dart';
import 'package:taam_app/screens/newtask.dart';

class homelayout extends StatefulWidget {
  final String email;
  const homelayout({
    super.key,
    required this.email,
  });

  @override
  State<homelayout> createState() => _homelayoutState();
}

class _homelayoutState extends State<homelayout> {
  // String name = "";
  // @override
  // void initState() {
  //   super.initState();
  //   getName();
  // }
  // Future<String> getName() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String userName = prefs.getString('userName') ?? "";
  //   setState(() {
  //     name = userName;
  //   });
  //   return userName;
  // }
  //

  int currentindex =0;

  List<Widget>screens=[
    newtaskscreen(),
    donetaskesscreen(),
    ArchivedTasksScreen()
  ];
  List<String> titles=[
    'new taskes',
    'done taskes',
    'archived taskes'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          titles[currentindex]
        ),
      ),
      body: screens[currentindex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index){
          setState(
                  ()
          {
            currentindex=index;
          }
          );
        },
        items: [
          BottomNavigationBarItem(
              icon:Icon(
                Icons.menu
              ),
            label: 'Taskes',
          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.check_circle_outline
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.archive
            ),
            label: 'archive',
          ),

        ],
      ),
    );
  }
}