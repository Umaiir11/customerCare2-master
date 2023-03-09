class ParModAccLedger {

  String? Pr_AccountDID;
  String? Pr_FromDate;
  String? Pr_ToDate;

  ParModAccLedger(
      {required this.Pr_AccountDID,
        required this.Pr_FromDate,
        required this.Pr_ToDate});

  Map<String, dynamic> toJson() {
    return {
      'Pr_AccountDID': Pr_AccountDID,
      'Pr_FromDate': Pr_FromDate,
      'Pr_ToDate': Pr_ToDate,
    };
  }
}
