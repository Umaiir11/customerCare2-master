class ParModUserProfile {

  String? Pr_EmailID;
  String? Pr_Password;
  String? Pr_CompanyDID;

  ParModUserProfile(
      {required this.Pr_EmailID,
      required this.Pr_Password,
      required this.Pr_CompanyDID});

  Map<String, dynamic> toJson() {
    return {
      'pr_EmailID': Pr_EmailID,
      'pr_Password': Pr_Password,
      'pr_CompanyDID': Pr_CompanyDID,
    };
  }
}
