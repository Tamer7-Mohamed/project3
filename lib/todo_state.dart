part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TODOLoading extends TodoState {}

class TODOSuccess extends TodoState {}

class TODOError extends TodoState{}
