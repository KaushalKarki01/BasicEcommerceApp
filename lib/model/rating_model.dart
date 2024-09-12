class Rating {
  final double rate;
  final int count;

  //constructor
  Rating({required this.rate, required this.count});

  // json to dart object
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: (json['rate'] as num).toDouble(), count: json['count']);
  }

  //object to json
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
