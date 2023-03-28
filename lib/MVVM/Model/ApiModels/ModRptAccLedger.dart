class ModRptAccLedger {
  int Pr_FormDID = 0;

  String Pr_ReportName = "";

  int Pr_BranchID = 0;

  String Pr_Token = "";

  String Pr_AccountDID = "";


  DateTime Pr_FromDate = DateTime.parse("2022-01-13T13:49:44");
  DateTime Pr_ToDate = DateTime.parse("2022-08-13T13:49:44");
  String Pr_WhereClause_PC = "";

  String Pr_GroupByClause_PC = "";

  String Pr_OrderByClause_PC = "";

  String Pr_City = "";

  String Pr_Address = "";

  String Pr_PrintedBy = "";

  ModRptAccLedger(
      { required this.Pr_FormDID,
        required this.Pr_ReportName,
        required this.Pr_BranchID,
        required this.Pr_Token,
        required this.Pr_AccountDID,
        required this.Pr_FromDate,
        required this.Pr_ToDate,
        required this.Pr_WhereClause_PC,
        required this.Pr_GroupByClause_PC,
        required this.Pr_OrderByClause_PC,
        required this.Pr_City,
        required this.Pr_Address,
        required this.Pr_PrintedBy
      });


  Map<String, dynamic> toJson() {
    return {
      'Pr_FormDID': Pr_FormDID,
      'Pr_ReportName': Pr_ReportName,
      'Pr_BranchID': Pr_BranchID,
      'Pr_Token': Pr_Token,
      'Pr_AccountDID': Pr_AccountDID,
      'Pr_FromDate':  Pr_FromDate.toIso8601String(),
      'Pr_ToDate': Pr_ToDate.toIso8601String(),
      'Pr_WhereClause_PC': Pr_WhereClause_PC,
      'Pr_GroupByClause_PC': Pr_GroupByClause_PC,
      'Pr_OrderByClause_PC': Pr_OrderByClause_PC,
      'Pr_City': Pr_City,
      'Pr_Address': Pr_Address,
      'Pr_PrintedBy': Pr_PrintedBy,
    };
  }

}
