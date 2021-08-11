part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

// Note Code 12 untuk load data user yang berhasil
class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
  @override
  List<Object> get props => [];
}

class UserLoadingFailed extends UserState {
  final String message;
  UserLoadingFailed(this.message);
  @override
  List<Object> get props => [];
}
