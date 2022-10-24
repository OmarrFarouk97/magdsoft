part of 'global_cubit.dart';

@immutable
abstract class GlobalState {

}

class GlobalInitial extends GlobalState {}


class RegisterLoadingState extends GlobalState {}
class RegisterSuccessState extends GlobalState {
  final  RegisterModel registerModel;

  RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends GlobalState {
  final String error;

  RegisterErrorState(this.error);
}


class OtpLoadingState extends GlobalState {}
class OtpSuccessState extends GlobalState {
  final  OtpModel otpModel;

  OtpSuccessState(this.otpModel);
}
class OtpErrorState extends GlobalState {
  final String error;

  OtpErrorState(this.error);
}



class HelpLoadingState extends GlobalState {}
class HelpSuccessState extends GlobalState {
  final  HelpModel getModel;

  HelpSuccessState(this.getModel);
}
class HelpErrorState extends GlobalState {
  final String error;

  HelpErrorState(this.error);
}


class GetProducatLoadingState extends GlobalState {}

class GetProducatSuccessState extends GlobalState {
final GetProductModel getProductModel;
  //final List<Products> productsList;


  GetProducatSuccessState(this.getProductModel );
}
class GetProducatErrorState extends GlobalState {
  final String error;

  GetProducatErrorState(this.error);
}





class TaskBottomNavState extends GlobalState {}
class SetState extends GlobalState {}
class ChangeFiltersChoice extends GlobalState {}




class GetProductsSuccessState extends GlobalState {
  final List<Products> productsList;

  GetProductsSuccessState({required this.productsList});
}
