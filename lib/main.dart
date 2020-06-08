import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meu_resumo/pages/my_resume/my_resume_page.dart';

import 'bloc/bloc_delegate.dart';
import 'data/provider/data_provider.dart';
import 'values/strings.dart';

void main() {
  DataProvider.instance.init();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        theme: ThemeData(fontFamily: 'ProximaNova'),
        title: materialAppTitle,
        debugShowCheckedModeBanner: false,
        locale: const Locale("pt", "BR"),
        home: MyResumePage());
  }
}
