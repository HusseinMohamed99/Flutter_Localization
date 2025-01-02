import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/di/dependency_injection.dart';
import 'package:flutter_localization/generated/l10n.dart';
import 'package:flutter_localization/logic/change_language_cubit.dart';
import 'package:flutter_localization/logic/change_language_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangeLanguageCubit>(),
      child: BlocConsumer<ChangeLanguageCubit, ChangeLanguageState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<String> footballTeam = [
            S.of(context).al_ahly,
            S.of(context).zamalek,
            S.of(context).pyramids_fc,
            S.of(context).smouha,
          ];
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                S.of(context).app_name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: footballTeam.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(footballTeam[index]),
                      );
                    },
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    context.read<ChangeLanguageCubit>().changeLanguage();
                  },
                  child: Text('Change Language'),
                ),
                SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
