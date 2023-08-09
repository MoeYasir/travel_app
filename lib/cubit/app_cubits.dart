import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/model/data_mode.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  late final places;
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  void detailPage(DataModel data) {
    emit(DetailState(data));
  }

  loading() {
    return CircularProgressIndicator();
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
