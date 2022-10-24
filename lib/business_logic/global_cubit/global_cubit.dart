import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/models/account_model.dart';
part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  var phoneController = TextEditingController();
  var nameController = TextEditingController();

   RegisterModel? registerModel;
   OtpModel? otpModel;

   List<Products>? products;
  GetProductModel? getProductModel;
   HelpModel? getModel;

  int currentIndex =-1;

  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    emit(TaskBottomNavState());
  }



  bool isExpanded =true;
  void setState( bool ex)
  {
isExpanded=ex;
    emit(SetState());
  }




  void userRegister({
    required String name,
    required String phone,
  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: verifyPhone,
      data: {
        'name':name,
        'phone':phone,
      },
    ).then((value)
    {

      registerModel= RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void otpDetails({
    required String code,
    required String phone,
  })
  {
    emit(OtpLoadingState());
    DioHelper.postData(
      url: otp,
      data: {
        'code':code,
        'phone':phone,
      },
    ).then((value)
    {
      otpModel= OtpModel.fromJson(value.data);
      emit(OtpSuccessState(otpModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(OtpErrorState(error.toString()));
    });
  }

  void getHelpDetails(){
    {
      emit(HelpLoadingState());
      DioHelper.getData(
        url:getHelp,
      ).then((value)
      {
        getModel= HelpModel.fromJson(value.data);

        emit(HelpSuccessState(getModel!));
      }).catchError((error)
      {
        print(error.toString());
        emit(HelpErrorState(error.toString()));
      });
    }

  }


  void getHomeDetails(){
    {
      emit(GetProducatLoadingState());
      DioHelper.getData(
        url:getProducts,
      ).then((value)
      {
        getProductModel= GetProductModel.fromJson(value.data);
        print(getProductModel!.products!.length);

        emit(GetProducatSuccessState(getProductModel!));
      }).catchError((error)
      {
        print(error.toString());
        emit(GetProducatErrorState(error.toString()));
      });
    }

  }


  int filtersDefaultChoice = 0;

  void selectFilter({required int filterIndex}) {
    filtersDefaultChoice = filterIndex;
    emit(ChangeFiltersChoice());
  }


}

