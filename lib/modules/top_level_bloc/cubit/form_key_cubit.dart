import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit() : super(false);

  void setStatus(bool value) => emit(value);

  void toggle() => emit(!state);
}

class TableNameCubit extends Cubit<String> {
  TableNameCubit() : super('');

  void setTableName(String value) => emit(value);
}

class TableStatusCubit extends Cubit<Color> {
  TableStatusCubit() : super(Colors.black);

  void setTableStatus(Color value) => emit(value);
}

class MakeOrderCubit extends Cubit<bool> {
  MakeOrderCubit() : super(false);

  void setStatus(bool value) => emit(value);

  void toggle() => emit(!state);
}