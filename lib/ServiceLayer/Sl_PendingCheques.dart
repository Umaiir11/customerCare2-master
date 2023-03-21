import 'dart:convert';

import 'package:customercare/MVVM/Model/ParameterModels/ParModPendingCheques.dart';

import '../../ClassModules/cmHttpCalls.dart';
import '../MVVM/Model/ApiModels/ModPendingCheques.dart';

class Sl_PendingCheques {
  Future<List<ModPendingCheques>?> Fnc_PendingCheques() async {
    try {

      ParModPendingCheques l_ParModPendingCheques = new ParModPendingCheques(
          Pr_Branchid: "1",
          Pr_WhereClause: "",
          Pr_GroupByClause: "",
          Pr_OrderByClause: "");

      String l_jsonString = json.encode((l_ParModPendingCheques.toJson()));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/RptPendingCheques/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        var a = l_response;
        print(a);
        print("Pending Cheques");
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModPendingCheques Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModPendingCheques l_ModPendingCheques = new ModPendingCheques();

    l_ModPendingCheques.Pr_PKGUID = l_JsonObject["Pr_PKGUID"] ?? '0' ;
    l_ModPendingCheques.Pr_VNO = l_JsonObject["Pr_VNO"] ?? 0;
    l_ModPendingCheques.Pr_VoucherNo = l_JsonObject["Pr_VoucherNo"] ?? '0';
    l_ModPendingCheques.Pr_VDate =
        DateTime.parse(l_JsonObject["Pr_VDate"] ?? "2022-08-06T00:00:00") ;
    l_ModPendingCheques.Pr_ChequeDate =
        DateTime.parse( l_JsonObject["Pr_ChequeDate"] ?? "2022-08-06T00:00:00") ;
    l_ModPendingCheques.Pr_AccountDID = l_JsonObject["Pr_AccountDID"] ?? '0';
    l_ModPendingCheques.Pr_AccountID = l_JsonObject["Pr_AccountID"] ?? '0';
    l_ModPendingCheques.Pr_ChequeNo = l_JsonObject["Pr_ChequeNo"] ?? '0';
    l_ModPendingCheques.Pr_RefNo = l_JsonObject["Pr_RefNo"] ?? '0';
    l_ModPendingCheques.Pr_Remarks = l_JsonObject["Pr_Remarks"] ?? '0';

    lat:
    l_ModPendingCheques.Pr_Amount = l_JsonObject["Pr_Amount"] ?? 0;
    lat:
    l_ModPendingCheques.Pr_PendingDebit =
        l_JsonObject["Pr_PendingDebit"] ?? 0;
    lat:
    l_ModPendingCheques.Pr_PendingCredit =
        l_JsonObject["Pr_PendingCredit"] ?? 0;

    l_ModPendingCheques.Pr_ChequeStatusDID =
        l_JsonObject["Pr_ChequeStatusDID"] ?? 0;
    l_ModPendingCheques.Pr_ChequeStatus =
        l_JsonObject["Pr_ChequeStatus"] ?? '0';
    l_ModPendingCheques.Pr_ChequeType = l_JsonObject["Pr_ChequeType"] ?? 0;
    l_ModPendingCheques.Pr_PostedID = l_JsonObject["Pr_PostedID"] ?? false;
    l_ModPendingCheques.Pr_BranchID = l_JsonObject["Pr_BranchID"] ?? 0;
    return l_ModPendingCheques;
  }

  List<ModPendingCheques> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModPendingCheques> l_ListModPendingCheques =
    new List<ModPendingCheques>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModPendingCheques l_ModPendingCheques = new ModPendingCheques();
      l_ModPendingCheques = Fnc_JsonToModel(l_JsonObject);
      l_ListModPendingCheques.add(l_ModPendingCheques);
    }
    return l_ListModPendingCheques;
  }
}
