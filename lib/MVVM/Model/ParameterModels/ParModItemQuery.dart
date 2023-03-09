class ParModItemQuery {
  int? Pr_Branchid;
  String? Pr_WhereClause;
  String? Pr_GroupByClause;
  String? Pr_OrderByClause;
  List<String>? Pr_List_Properties;

  ParModItemQuery({
    required this.Pr_Branchid,
    required this.Pr_WhereClause,
    required this.Pr_GroupByClause,
    required this.Pr_OrderByClause,
    required this.Pr_List_Properties,
  });

  Map<String, dynamic> toJson() {
    return {
      'Pr_Branchid': Pr_Branchid,
      'Pr_WhereClause': Pr_WhereClause,
      'Pr_GroupByClause': Pr_GroupByClause,
      'Pr_OrderByClause': Pr_OrderByClause,
      'Pr_List_Properties': Pr_List_Properties,
    };
  }
}
