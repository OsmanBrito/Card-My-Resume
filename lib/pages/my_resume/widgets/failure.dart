import 'package:flutter/material.dart';
import 'package:meu_resumo/bloc/wealth_bloc.dart';
import 'package:meu_resumo/values/images_path.dart';

Widget FailureWidget(WealthBloc bloc) {
  return Center(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Ops . . . Ocoreu um erro inesperado, tente novamente'),
          Image.asset(errorImage),
          RaisedButton(
            onPressed: () => bloc.add(LoadWealthSummary()),
            child: Text('Tentar novamente'),
          )
        ],
      ),
    ),
  );
}
