class Calculation {
  final String expression;
  final String? dateTime;
  final String result;

  Calculation({
    required this.expression,
    required this.result,
    this.dateTime,
  });

  factory Calculation.fromJson(Map<String, dynamic> json) => Calculation(
        dateTime: json['dateTime'],
        expression: json['expression'],
        result: json['result'],
      );

  Map<String, dynamic> toJson() => {
        'dateTime': dateTime,
        'expression': expression,
        'result': result,
      };
}
