class ParModUserAccQuery {

  String? Pr_Branchid;
  String? Pr_WhereClause;
  String? Pr_GroupByClause;
  String? Pr_OrderByClause;

  ParModUserAccQuery(
      {required this.Pr_Branchid,
        required this.Pr_WhereClause,
        required this.Pr_GroupByClause,
        required this.Pr_OrderByClause,

      });

  Map<String, dynamic> toJson() {
    return {
      'Pr_Branchid': Pr_Branchid,
      'Pr_WhereClause': Pr_WhereClause,
      'Pr_GroupByClause': Pr_GroupByClause,
      'Pr_OrderByClause': Pr_OrderByClause,
    };
  }
}
