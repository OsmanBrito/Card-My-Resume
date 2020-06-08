import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meu_resumo/data/model/wealth_summary.dart';
import 'package:meu_resumo/data/repository/wealth_repository.dart';
import 'package:meu_resumo/injector.dart';

part 'wealth_event.dart';
part 'wealth_state.dart';

class WealthBloc extends Bloc<WealthEvent, WealthState> {
  final WealthRepository wealthRepository = Injector.instance.wealthRepository;

  @override
  WealthState get initialState => WealthLoading();

  @override
  Stream<WealthState> mapEventToState(
    WealthEvent event,
  ) async* {
    if (event is LoadWealthSummary) {
      yield* _loadWealthSummary();
    }
  }

  Stream<WealthState> _loadWealthSummary() async* {
    yield WealthLoading();
    try {
      final result = await wealthRepository.getWealthSummary();
      yield result != null ? WealthLoaded(result) : WealthFailure();
    } catch (e) {
      yield WealthFailure();
    }
  }
}
