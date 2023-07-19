// ignore_for_file: unnecessary_statements, use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:diyo/models/user.dart';
import 'package:diyo/repositories/main_repository.dart';
import 'package:diyo/services/hive_service.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.lang) : super(const AppLoading(null));

  final String lang;

  Future<dynamic> init() async {
    final _service = MainRepository();
    await _service.init(lang);

    await refresh();
  }

  Future<dynamic> refresh() async {
    emit(AppLoading(state.user));

    final user = GetIt.I<HiveService>().getUser();

    emit(AppInitial(user));
  }
}
