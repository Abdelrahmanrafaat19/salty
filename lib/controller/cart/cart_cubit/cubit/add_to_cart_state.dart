part of 'add_to_cart_cubit.dart';

sealed class AddCartDataState {}

final class AddCartDataInitial extends AddCartDataState {}

class AddCartDataLoading extends AddCartDataState {}

class AddCartDataSuccess extends AddCartDataState {}

class AddCartDataFailure extends AddCartDataState {
  final String errMessage;

  AddCartDataFailure(this.errMessage);
}
