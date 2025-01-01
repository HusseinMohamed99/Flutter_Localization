import 'package:flutter/material.dart';
import 'package:flutter_localization/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView.builder(
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
    );
  }
}
