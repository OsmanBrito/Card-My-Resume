import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meu_resumo/bloc/wealth_bloc.dart';
import 'package:meu_resumo/pages/my_resume/widgets/card_my_resume.dart';
import 'package:meu_resumo/pages/my_resume/widgets/failure.dart';
import 'package:meu_resumo/values/colors.dart';
import 'package:meu_resumo/values/size_config.dart';
import 'package:meu_resumo/values/strings.dart';
import 'package:meu_resumo/values/text_styles.dart';

class MyResumePage extends StatefulWidget {
  MyResumePage({Key key}) : super(key: key);

  @override
  _MyResumePageState createState() => _MyResumePageState();
}

class _MyResumePageState extends State<MyResumePage> {
  WealthBloc wealthBloc;

  @override
  void initState() {
    wealthBloc = WealthBloc();
    wealthBloc.add(LoadWealthSummary());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<WealthBloc>(
      create: (BuildContext context) => wealthBloc,
      child: Scaffold(
        body: BlocBuilder<WealthBloc, WealthState>(
          bloc: wealthBloc,
          builder: (BuildContext context, WealthState state) {
            if (state is WealthLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WealthLoaded) {
              return MyResumeCard(
                SizeConfig.screenWidth,
                state.wealthSummary,
              );
            } else if (state is WealthFailure) {
              return FailureWidget(wealthBloc);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
