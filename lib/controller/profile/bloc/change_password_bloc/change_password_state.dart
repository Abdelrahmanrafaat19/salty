part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordIsLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final Map<String, dynamic> data;

  ChangePasswordSuccess({required this.data});
}

final class ChangePasswordFailure extends ChangePasswordState {
  final dynamic message;

  ChangePasswordFailure({required this.message});
}
