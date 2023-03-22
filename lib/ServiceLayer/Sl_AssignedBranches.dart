import 'dart:convert';
import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:customercare/ClassModules/cmHttpCalls.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModAssignedBranches.dart';
import 'package:customercare/MVVM/Model/ParameterModels/ParModAssignedBranches.dart';

class Sl_AssignedBranches {
  Future<List<ModAssignedBranches>?> Fnc_AssignedBranches() async {
    try {
      ParModAssignedBranches lParModAssignedBranches =
          ParModAssignedBranches(
              Pr_Branchid: "1",
              Pr_WhereClause: "where UserDID='${cmGlobalVariables.Pb_UserDID!}'",
              Pr_GroupByClause: "",
              Pr_OrderByClause: "");

      String lJsonString = json.encode((lParModAssignedBranches.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/RptAssignedBranches/Fnc_Read_Sp', lUtfContent);

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

  ModAssignedBranches Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModAssignedBranches lModAssignedBranches = ModAssignedBranches();
    lModAssignedBranches.pr_UserDID = lJsonObject["Pr_UserDID"];
    lModAssignedBranches.pr_BranchDID = lJsonObject["Pr_BranchDID"];
    lModAssignedBranches.pr_BranchName = lJsonObject["Pr_BranchName"];
    lModAssignedBranches.pr_BranchPreFix = lJsonObject["Pr_BranchPreFix"];
    lModAssignedBranches.pr_Address = lJsonObject["Pr_Address"];
    lModAssignedBranches.pr_IsAssigned = lJsonObject["Pr_IsAssigned"];
    return lModAssignedBranches;
  }

  List<ModAssignedBranches> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    //Declare Local Variable For list Of Model and instance

    List<ModAssignedBranches> lListModBranchSettting =
        List<ModAssignedBranches>.empty(growable: true);

    //Start Irritation From Json String

    for (dynamic lJsonObject in lJsonList) {
      ModAssignedBranches lModBranchSettting = ModAssignedBranches();
      lModBranchSettting = Fnc_JsonToModel(lJsonObject);
      lListModBranchSettting.add(lModBranchSettting);
    }
    return lListModBranchSettting;
  }
}
