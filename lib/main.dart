import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/bloc_observer.dart';
import 'package:flutter_localization/generated/l10n.dart';
import 'package:flutter_localization/home_screen.dart';
import 'package:flutter_localization/logic/change_language_cubit.dart';
import 'package:flutter_localization/logic/change_language_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final changeLanguageCubit = getIt<ChangeLanguageCubit>();
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      bloc: changeLanguageCubit,
      builder: (context, state) {
        return MaterialApp(
          locale: Locale(changeLanguageCubit.currentLanguage),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Flutter Localization',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}
