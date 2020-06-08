part of 'wealth_bloc.dart';

abstract class WealthState extends Equatable {
  const WealthState();
}

class WealthInitial extends WealthState {
  @override
  List<Object> get props => [];
}

class WealthLoading extends WealthState {
  @override
  List<Object> get props => [];

  String toString() => 'WealthLoading';
}

class WealthLoaded extends WealthState {
  final WealthSummary wealthSummary;

  WealthLoaded(this.wealthSummary);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'WealthLoaded';
}

class WealthFailure extends WealthState {
  @override
  List<Object> get props => [];

  String toString() => 'WealthFailure';
}
