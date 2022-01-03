class User {
  int number;
  bool haveResidue;
  double valorReceber;

  User({this.number, this.haveResidue, this.valorReceber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        number: json['number'],
        haveResidue: json['haveResidues'],
        valorReceber: json['valorReceber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'number' : number.toString(),
      'haveResidue' : haveResidue.toString(),
      'valorReceber' : valorReceber.toString()
    };
  }
}
