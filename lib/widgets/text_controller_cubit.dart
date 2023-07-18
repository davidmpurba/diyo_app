import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextEditingControllerCubit extends Cubit<TextEditingController> {
  TextEditingControllerCubit({String? initial})
      : super(TextEditingController(text: initial));
}
