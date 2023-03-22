import 'dart:convert';

import 'package:customercare/MVVM/Model/ParameterModels/PrModAccLedger.dart';
import 'package:intl/intl.dart';

import '../../ClassModules/cmHttpCalls.dart';
import '../MVVM/Model/ApiModels/ModAccLedger.dart';

class Sl_AccountLedger {
  Future<List<ModAccountLedger>?> Fnc_AccountLedger(
    DateTime StartDate,
    DateTime EndDate,
  ) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String lStartDate = formatter.format(StartDate);
      final String lDateTime = formatter.format(EndDate);
      String? lAccountsDID = "a01cc68a-28fe-411e-9fba-798d375b68fc";

      ParModAccLedger lParModAccLedger = ParModAccLedger(
          Pr_AccountDID: lAccountsDID,
          Pr_FromDate: lStartDate,
          Pr_ToDate: lDateTime);

      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String lJsonString = json.encode((lParModAccLedger.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/RptAccountLedger/Fnc_Read_SP', lUtfContent);

      if (lResponse.statusCode == 200) {
        var a = lResponse;
        print("Account Ledgers");
        return Fnc_JsonToListOfModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModAccountLedger Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModAccountLedger lModIAccountLedger = ModAccountLedger();

    lModIAccountLedger.Pr_PKGUID = lJsonObject["Pr_PKGUID"] ?? '0';
    lModIAccountLedger.Pr_SrNo = lJsonObject["Pr_SrNo"] ?? 0;
    lModIAccountLedger.Pr_VNO = lJsonObject["Pr_VNO"] ?? '0';
    lModIAccountLedger.Pr_VDate =
        DateTime.parse(lJsonObject["Pr_VDate"] ?? "2022-08-13T13:49:44");
    lModIAccountLedger.Pr_AccountDID = lJsonObject["Pr_AccountDID"] ?? '0';
    lModIAccountLedger.Pr_AccountID = lJsonObject["Pr_AccountID"] ?? '0';
    lModIAccountLedger.Pr_CurrencyCode =
        lJsonObject["Pr_CurrencyCode"] ?? '0';
    lModIAccountLedger.Pr_RefNo = lJsonObject["Pr_RefNo"] ?? '0';
    lModIAccountLedger.Pr_Remarks = lJsonObject["Pr_Remarks"] ?? '0';
    lModIAccountLedger.Pr_Narrations = lJsonObject["Pr_Narrations"] ?? '0';
    lModIAccountLedger.Pr_CrossAccountDID =
        lJsonObject["Pr_CrossAccountDID"] ?? '0';
    lModIAccountLedger.Pr_CrossAccountID =
        lJsonObject["Pr_CrossAccountID"] ?? '0';
    lModIAccountLedger.Pr_CrossCurrencyCode =
        lJsonObject["Pr_CrossCurrencyCode"] ?? '0';
    lModIAccountLedger.Pr_Debit = lJsonObject["Pr_Debit"] ?? 0;
    lModIAccountLedger.Pr_Credit = lJsonObject["Pr_Credit"] ?? 0;
    lModIAccountLedger.Pr_ExRate = lJsonObject["Pr_ExRate"] ?? 0;
    lModIAccountLedger.Pr_Balance = lJsonObject["Pr_Balance"] ?? 0;

    lModIAccountLedger.Pr_ST = lJsonObject["Pr_ST"] ?? '0';
    lModIAccountLedger.Pr_VMDID = lJsonObject["Pr_VMDID"] ?? '0';
    lModIAccountLedger.Pr_VDDID = lJsonObject["Pr_VDDID"] ?? '0';

    lModIAccountLedger.Pr_VType = lJsonObject["Pr_VType"] ?? 0;

    lModIAccountLedger.Pr_Voucher = lJsonObject["Pr_Voucher"] ?? '0';
    lModIAccountLedger.Pr_PostedID = lJsonObject["Pr_PostedID"] ?? false;
    lModIAccountLedger.Pr_TransID = lJsonObject["Pr_TransID"] ?? 0;
    lModIAccountLedger.Pr_BranchID = lJsonObject["Pr_BranchID"] ?? 0;
    return lModIAccountLedger;
  }

  List<ModAccountLedger> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    List<ModAccountLedger> lListModIAccountLedger =
        List<ModAccountLedger>.empty(growable: true);
    for (dynamic lJsonObject in lJsonList) {
      ModAccountLedger lModIAccountLedger = ModAccountLedger();
      lModIAccountLedger = Fnc_JsonToModel(lJsonObject);
      lListModIAccountLedger.add(lModIAccountLedger);
    }
    return lListModIAccountLedger;
  }
}
