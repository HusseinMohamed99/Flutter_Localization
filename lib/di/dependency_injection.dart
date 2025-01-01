import 'package:flutter_localization/logic/change_language_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton(() => ChangeLanguageCubit());
}
