class Us {
  double? amount;
  String? unitShort;
  String? unitLong;

  Us({this.amount, this.unitShort, this.unitLong});

  factory Us.fromJson(json) {
    return Us(
      amount: json['amount'] as double?,
      unitShort: json['unitShort'] as String?,
      unitLong: json['unitLong'] as String?,
    );
  }

  toJson() => {
        'amount': amount,
        'unitShort': unitShort,
        'unitLong': unitLong,
      };
}
