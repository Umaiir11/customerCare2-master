import 'dart:convert';
import '../../ClassModules/cmHttpCalls.dart';
import '../MVVM/Model/ApiModels/ModPendingSaleOrder.dart';
import '../MVVM/Model/ParameterModels/ParModPendingSaleOrder.dart';

class Sl_PendingSelOrder {
  Future<List<ModPendingSaleOrder>?> Fnc_PendingSO() async {
    try {
      String? Did ="30B8C293-198D-4560-8EA9-249E9CD146B3";
      //String? Did = cmGlobalVariables.Pb_AccountsDID;

      print(Did);
      print(Did);
      ParModPendingSaleOrder lParModPendingSaleOrder =
          ParModPendingSaleOrder(Pr_Branchid: 1, Pr_AccountDID: Did);

      final body = {
        "Pr_Branchid": 1,
        // "Pr_AccountDID": "30B8C293-198D-4560-8EA9-249E9CD146B3"
        "Pr_AccountDID": Did};

      String lJsonString = json.encode((lParModPendingSaleOrder.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/RptPendingSaleOrder/Fnc_Read_SP', lUtfContent);

      if (lResponse.statusCode == 200) {
        var a = lResponse;
        print(a);
        print("Pending S/O)");
        return Fnc_JsonToListOfModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModPendingSaleOrder Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModPendingSaleOrder lModIPendingSaleOrder = ModPendingSaleOrder();

    lModIPendingSaleOrder.Pr_PKGUID = lJsonObject["Pr_PKGUID"] ?? '0';
    lModIPendingSaleOrder.Pr_VNO = lJsonObject["Pr_VNO"] ?? 0;
    lModIPendingSaleOrder.Pr_VoucherNo = lJsonObject["Pr_VoucherNo"] ?? '0';
    lModIPendingSaleOrder.Pr_VDate =
        DateTime.parse(lJsonObject["Pr_VDate"] ?? "2022-08-13T13:49:44");
    lModIPendingSaleOrder.Pr_AccountDID =
        lJsonObject["Pr_AccountDID"] ?? '0';
    lModIPendingSaleOrder.Pr_AccountID = lJsonObject["Pr_AccountID"] ?? '0';
    lModIPendingSaleOrder.Pr_CustomerRefNo =
        lJsonObject["Pr_CustomerRefNo"] ?? '0';
    lModIPendingSaleOrder.Pr_RefNo = lJsonObject["Pr_RefNo"] ?? '0';
    lModIPendingSaleOrder.Pr_Remarks = lJsonObject["Pr_Remarks"] ?? '0';
    lat:
    lModIPendingSaleOrder.Pr_FGrandTotal =
        lJsonObject["Pr_FGrandTotal"] ?? 0;
    lat:
    lModIPendingSaleOrder.Pr_CGrandTotal =
        lJsonObject["Pr_CGrandTotal"] ?? 0;
    lat:
    lModIPendingSaleOrder.Pr_FExportableAmount =
        lJsonObject["Pr_FExportableAmount"] ?? 0;
    lat:
    lModIPendingSaleOrder.Pr_CExportableAmount =
        lJsonObject["Pr_CExportableAmount"] ?? 0;
    lat:
    lModIPendingSaleOrder.Pr_FPendingAmount =
        lJsonObject["Pr_FPendingAmount"] ?? 0;
    lat:
    lModIPendingSaleOrder.Pr_CPendingAmount =
        lJsonObject["Pr_CPendingAmount"] ?? 0;
    lat:
    lModIPendingSaleOrder.Pr_PQty = lJsonObject["Pr_PQty"] ?? 0;
    lModIPendingSaleOrder.Pr_StageID = lJsonObject["Pr_StageID"] ?? '0';
    lModIPendingSaleOrder.Pr_BranchID = lJsonObject["Pr_BranchID"] ?? 0;
    return lModIPendingSaleOrder;
  }

  List<ModPendingSaleOrder> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    List<ModPendingSaleOrder> lListModIPendingSaleOrder =
        List<ModPendingSaleOrder>.empty(growable: true);
    for (dynamic lJsonObject in lJsonList) {
      ModPendingSaleOrder lModIPendingSaleOrder = ModPendingSaleOrder();
      lModIPendingSaleOrder = Fnc_JsonToModel(lJsonObject);
      lListModIPendingSaleOrder.add(lModIPendingSaleOrder);
    }
    return lListModIPendingSaleOrder;
  }
}
