class WealthSummary {
  double cdi;
  double gain;
  bool hasHistory;
  int id;
  double profitability;
  int total;

  WealthSummary(
      {this.cdi,
      this.gain,
      this.hasHistory,
      this.id,
      this.profitability,
      this.total});

  WealthSummary.fromJson(Map<String, dynamic> json) {
    cdi = json['cdi'];
    gain = json['gain'];
    hasHistory = json['hasHistory'];
    id = json['id'];
    profitability = json['profitability'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cdi'] = this.cdi;
    data['gain'] = this.gain;
    data['hasHistory'] = this.hasHistory;
    data['id'] = this.id;
    data['profitability'] = this.profitability;
    data['total'] = this.total;
    return data;
  }
}