import 'dart:convert';

import 'package:customercare/MVVM/Model/ParameterModels/ParModPendingCheques.dart';

import '../../ClassModules/cmHttpCalls.dart';
import '../MVVM/Model/ApiModels/ModPendingCheques.dart';

class Sl_PendingCheques {
  Future<List<ModPendingCheques>?> Fnc_PendingCheques() async {
    try {

      ParModPendingCheques lParModPendingCheques = ParModPendingCheques(
          Pr_Branchid: "1",
          Pr_WhereClause: "",
          Pr_GroupByClause: "",
          Pr_OrderByClause: "");

      String lJsonString = json.encode((lParModPendingCheques.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/RptPendingCheques/Fnc_Read_SP', lUtfContent);

      if (lResponse.statusCode == 200) {
        var a = lResponse;
        print(a);
        print("Pending Cheques");
        return Fnc_JsonToListOfModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModPendingCheques Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModPendingCheques lModPendingCheques = ModPendingCheques();

    lModPendingCheques.Pr_PKGUID = lJsonObject["Pr_PKGUID"] ?? '0' ;
    lModPendingCheques.Pr_VNO = lJsonObject["Pr_VNO"] ?? 0;
    lModPendingCheques.Pr_VoucherNo = lJsonObject["Pr_VoucherNo"] ?? '0';
    lModPendingCheques.Pr_VDate =
        DateTime.parse(lJsonObject["Pr_VDate"] ?? "2022-08-06T00:00:00") ;
    lModPendingCheques.Pr_ChequeDate =
        DateTime.parse( lJsonObject["Pr_ChequeDate"] ?? "2022-08-06T00:00:00") ;
    lModPendingCheques.Pr_AccountDID = lJsonObject["Pr_AccountDID"] ?? '0';
    lModPendingCheques.Pr_AccountID = lJsonObject["Pr_AccountID"] ?? '0';
    lModPendingCheques.Pr_ChequeNo = lJsonObject["Pr_ChequeNo"] ?? '0';
    lModPendingCheques.Pr_RefNo = lJsonObject["Pr_RefNo"] ?? '0';
    lModPendingCheques.Pr_Remarks = lJsonObject["Pr_Remarks"] ?? '0';

    lat:
    lModPendingCheques.Pr_Amount = lJsonObject["Pr_Amount"] ?? 0;
    lat:
    lModPendingCheques.Pr_PendingDebit =
        lJsonObject["Pr_PendingDebit"] ?? 0;
    lat:
    lModPendingCheques.Pr_PendingCredit =
        lJsonObject["Pr_PendingCredit"] ?? 0;

    lModPendingCheques.Pr_ChequeStatusDID =
        lJsonObject["Pr_ChequeStatusDID"] ?? 0;
    lModPendingCheques.Pr_ChequeStatus =
        lJsonObject["Pr_ChequeStatus"] ?? '0';
    lModPendingCheques.Pr_ChequeType = lJsonObject["Pr_ChequeType"] ?? 0;
    lModPendingCheques.Pr_PostedID = lJsonObject["Pr_PostedID"] ?? false;
    lModPendingCheques.Pr_BranchID = lJsonObject["Pr_BranchID"] ?? 0;
    return lModPendingCheques;
  }

  List<ModPendingCheques> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    List<ModPendingCheques> lListModPendingCheques =
    List<ModPendingCheques>.empty(growable: true);
    for (dynamic lJsonObject in lJsonList) {
      ModPendingCheques lModPendingCheques = ModPendingCheques();
      lModPendingCheques = Fnc_JsonToModel(lJsonObject);
      lListModPendingCheques.add(lModPendingCheques);
    }
    return lListModPendingCheques;
  }
}
