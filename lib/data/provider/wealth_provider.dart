import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gql/language.dart';
import 'package:meu_resumo/data/model/wealth_summary.dart';
import 'package:meu_resumo/data/queries/get_wealth_summary.dart' as queries;
import 'package:meu_resumo/values/strings.dart';

import 'data_provider.dart';

class WealthProvider {
  GraphQLClient _client;
  final OptimisticCache cache = OptimisticCache(
    dataIdFromObject: typenameDataIdFromObject,
  );

  WealthProvider() {
    _client = _setClient();
  }

  Future<WealthSummary> getWeatherSummary() async {
    try {
      final QueryOptions _options = QueryOptions(
        documentNode: parseString(queries.getWealthSummary),
        variables: <String, dynamic>{},
        pollInterval: 4,
      );
      var result = await _client.query(_options);
      return WealthSummary.fromJson(result.data.data['wealthSummary'][0]);
    } catch (e) {
      throw (e.message);
    }
  }

  GraphQLClient _setClient() {
    final HttpLink _httpLink = HttpLink(
        uri: DataProvider.instance.apiWealthSummary,
        headers: {"x-hasura-admin-secret": adminSecret});

    final Link _link = _httpLink;

    return GraphQLClient(
      cache: cache,
      link: _link,
    );
  }
}
