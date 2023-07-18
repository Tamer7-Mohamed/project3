import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taam_app/models/todomodel.dart';
import 'package:taam_app/servcis/todoservice.dart';
import 'package:taam_app/todo_cubit.dart';

class donetaskesscreen extends StatefulWidget {

  @override
  State<donetaskesscreen> createState() => _donetaskesscreenState();
}

class _donetaskesscreenState extends State<donetaskesscreen> {
  // List<Todomodole> todo = [];
  // bool isLoading = true;
  //
  // getUsers() async {
  //   todo = await todoservice().getuserdata();
  //   isLoading = false;
  //   setState(() {});
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getUsers();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        // BlocConsumer<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is TODOLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TODOSuccess) {
            return ListView.builder(
              itemCount: context.watch<TodoCubit>().todo.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Container(
                      height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red[900]
                        ),
                        child: Text(context.watch<TodoCubit>().todo[index].title ?? "--",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                    trailing: Container(
                      height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red[900]
                        ),
                        child: Text(context.watch<TodoCubit>().todo[index].completed.toString() ?? "--",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Error in this screen"),
            );
          }
        },
        listener: (context, state) {
          if (state is TODOError ) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Hello we have error"),
            ));
            print("Hello");
          }
        },
      ),
    );
  }
}

