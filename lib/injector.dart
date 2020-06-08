import 'package:meu_resumo/data/repository/wealth_repository.dart';
import 'package:rxdart/rxdart.dart';

class Injector {
  static final Injector instance = new Injector._injector();

  BehaviorSubject<List<String>> permissoesSubject =
      new BehaviorSubject.seeded([]);
  WealthRepository wealthRepository;

  factory Injector() {
    return instance;
  }

  Injector._injector() {
    wealthRepository = WealthRepository();
  }

  dispose() {
    permissoesSubject.close();
  }
}
