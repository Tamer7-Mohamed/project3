import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taam_app/models/todomodel.dart';
import 'package:taam_app/servcis/todoservice.dart';


part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()){
    getUsers();
  }

  List<Todomodole> todo = [];
  bool isLoading = true;

  getUsers() async {
    emit(TODOLoading());
    try {
      todo = await todoservice().getuserdata();
      isLoading = false;

      emit(TODOSuccess());
    } catch (e) {
      print(e.toString());
      emit(TODOError());
    }
}

}
