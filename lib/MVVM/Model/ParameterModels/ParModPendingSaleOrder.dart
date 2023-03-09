class ParModPendingSaleOrder {

  int? Pr_Branchid;
  String? Pr_AccountDID;
  ParModPendingSaleOrder(
      {required this.Pr_Branchid,
        required this.Pr_AccountDID});

  Map<String, dynamic> toJson() {
    return {
      'pr_EmailID': Pr_Branchid,
      'pr_Password': Pr_AccountDID,
    };
  }
}
