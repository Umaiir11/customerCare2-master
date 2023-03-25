class ParModPendingSaleOrder {

  int? Pr_Branchid;
  String? Pr_AccountDID;
  ParModPendingSaleOrder(
      {required this.Pr_Branchid,
        required this.Pr_AccountDID});

  Map<String, dynamic> toJson() {
    return {
      'Pr_Branchid': Pr_Branchid,
      'Pr_AccountDID': Pr_AccountDID,
    };
  }
}
