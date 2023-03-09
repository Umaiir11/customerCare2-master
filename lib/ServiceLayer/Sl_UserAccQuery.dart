import 'dart:convert';
import 'package:customercare/MVVM/Model/ParameterModels/PrModUserAccQuery.dart';

import '../../ClassModules/cmHttpCalls.dart';
import '../ClassModules/cmGlobalVariables.dart';
import '../MVVM/Model/ApiModels/ModUserAccQuery.dart';

class Sl_UserAccountsQuery {
  Future<List<ModUserAccountsQuery>?> Fnc_UserAccountsQuery() async {
    try {
      ParModUserAccQuery l_ParModUserAccQuery = new ParModUserAccQuery(
          Pr_Branchid: "1",
          Pr_WhereClause:
              "where EmailID='" + cmGlobalVariables.Pb_UserEmail! + "'",
          Pr_GroupByClause: "",
          Pr_OrderByClause: "");

      String l_jsonString = json.encode((l_ParModUserAccQuery.toJson()));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/UserAccountsQuery/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        var a = l_response;
        print(a);
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModUserAccountsQuery Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModUserAccountsQuery l_ModUserAccountsQuery = new ModUserAccountsQuery();

    l_ModUserAccountsQuery.Pr_AccountsDID = l_JsonObject["Pr_AccountsDID"];
    l_ModUserAccountsQuery.Pr_AccountID = l_JsonObject["Pr_AccountID"];
    l_ModUserAccountsQuery.Pr_CurrencyCode = l_JsonObject["Pr_CurrencyCode"];
    l_ModUserAccountsQuery.Pr_CityID = l_JsonObject["Pr_CityID"];
    l_ModUserAccountsQuery.Pr_BranchID = l_JsonObject["Pr_BranchID"];
    return l_ModUserAccountsQuery;
  }

  List<ModUserAccountsQuery> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModUserAccountsQuery> l_ListModUserAccountsQuery =
        new List<ModUserAccountsQuery>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModUserAccountsQuery l_ModUserAccountsQuery = new ModUserAccountsQuery();
      l_ModUserAccountsQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModUserAccountsQuery.add(l_ModUserAccountsQuery);
    }
    return l_ListModUserAccountsQuery;
  }
}
