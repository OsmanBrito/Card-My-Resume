part of 'wealth_bloc.dart';

abstract class WealthEvent extends Equatable {
  const WealthEvent();
}

class LoadWealthSummary extends WealthEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadWealthSummary';
}


