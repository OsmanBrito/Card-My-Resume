import 'package:meu_resumo/data/model/wealth_summary.dart';
import 'package:meu_resumo/data/provider/wealth_provider.dart';

class WealthRepository {
  Future<WealthSummary> getWealthSummary() async {
    try {
      WealthProvider wealthProvider = WealthProvider();
      return await wealthProvider.getWeatherSummary();
    } catch (e) {
      throw (e);
    }
  }
}
