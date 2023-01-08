part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {}

class AddUser extends UserEvent {
  final UserModel user;

  const AddUser(this.user);

  @override
  List<Object> get props => [user];
}

class RemoveUser extends UserEvent {
  final UserModel user;

  const RemoveUser(this.user);

  @override
  List<Object> get props => [user];
}
