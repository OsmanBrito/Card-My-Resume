class DataProvider {
  static final DataProvider instance = DataProvider._injector();
  String apiWealthSummary;

  DataProvider._injector();

  factory DataProvider() {
    return instance;
  }

  init() async {
    this.apiWealthSummary =
        "https://harura-fliper-test.herokuapp.com/v1/graphql";
  }
}
