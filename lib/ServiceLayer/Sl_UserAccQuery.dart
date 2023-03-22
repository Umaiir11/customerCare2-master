import 'dart:convert';
import 'package:customercare/MVVM/Model/ParameterModels/PrModUserAccQuery.dart';

import '../../ClassModules/cmHttpCalls.dart';
import '../ClassModules/cmGlobalVariables.dart';
import '../MVVM/Model/ApiModels/ModUserAccQuery.dart';

class Sl_UserAccountsQuery {
  Future<List<ModUserAccountsQuery>?> Fnc_UserAccountsQuery() async {
    try {
      ParModUserAccQuery lParModUserAccQuery = ParModUserAccQuery(
          Pr_Branchid: "1",
          Pr_WhereClause:
              "where EmailID='${cmGlobalVariables.Pb_UserEmail!}'",
          Pr_GroupByClause: "",
          Pr_OrderByClause: "");

      String lJsonString = json.encode((lParModUserAccQuery.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/UserAccountsQuery/Fnc_Read_SP', lUtfContent);

      if (lResponse.statusCode == 200) {
        var a = lResponse;
        print(a);
        return Fnc_JsonToListOfModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModUserAccountsQuery Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModUserAccountsQuery lModUserAccountsQuery = ModUserAccountsQuery();

    lModUserAccountsQuery.Pr_AccountsDID = lJsonObject["Pr_AccountsDID"];
    lModUserAccountsQuery.Pr_AccountID = lJsonObject["Pr_AccountID"];
    lModUserAccountsQuery.Pr_CurrencyCode = lJsonObject["Pr_CurrencyCode"];
    lModUserAccountsQuery.Pr_CityID = lJsonObject["Pr_CityID"];
    lModUserAccountsQuery.Pr_BranchID = lJsonObject["Pr_BranchID"];
    return lModUserAccountsQuery;
  }

  List<ModUserAccountsQuery> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    List<ModUserAccountsQuery> lListModUserAccountsQuery =
        List<ModUserAccountsQuery>.empty(growable: true);
    for (dynamic lJsonObject in lJsonList) {
      ModUserAccountsQuery lModUserAccountsQuery = ModUserAccountsQuery();
      lModUserAccountsQuery = Fnc_JsonToModel(lJsonObject);
      lListModUserAccountsQuery.add(lModUserAccountsQuery);
    }
    return lListModUserAccountsQuery;
  }
}
