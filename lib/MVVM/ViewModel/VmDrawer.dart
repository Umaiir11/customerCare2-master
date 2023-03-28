import 'package:customercare/MVVM/Model/ApiModels/ModAssignedBranches.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModUserAccQuery.dart';
import 'package:get/get.dart';

import '../../ClassModules/cmGlobalVariables.dart';
import '../../Searching/SrCompanyList.dart';
import '../../ServiceLayer/Sl_UserAccQuery.dart';
import 'VmCompany.dart';

class VmDrawer extends GetxController {
  final VmCompany G_VmCompany = Get.find();
  final SrCompanyList G_SrCompanyList = Get.find();
  RxList<int>? PrDecodeImage = RxList<int>([]);

  List<int>? get Pr_DecodeData_Image => PrDecodeImage!.value;

  set Pr_DecodeData_Image(List<int>? value) {
    PrDecodeImage!.value = value!;
  }

  RxInt l_PrselectedIndex = 0.obs;

  RxInt get Pr_txtselectedIndex_Text {
    return l_PrselectedIndex;
  }

  set Pr_txtselectedIndex_Text(RxInt value) {
    l_PrselectedIndex = value;
  }

  RxInt l_PrselectedDrawerMenu = 0.obs;

  RxInt get Pr_txtselectedDrawerMenu_Text {
    return l_PrselectedIndex;
  }

  set Pr_selectedDrawerMenu_Text(RxInt value) {
    l_PrselectedIndex = value;
  }

  RxBool Pr_isLoading = false.obs;

  RxBool get Pr_isLoading_wid {
    return Pr_isLoading;
  }

  set Pr_isLoading_wid(RxBool value) {
    Pr_isLoading = value;
  }

  //AssignedBranchesList
  RxList<ModAssignedBranches>? l_PrAssignedBranchesList = <ModAssignedBranches>[].obs;

  void Fnc_addItem() {
    if (l_PrAssignedBranchesList?.isEmpty ?? true) {
      l_PrAssignedBranchesList?.addAll(G_VmCompany.l_PrAssignedBranchesList!);
    }
  }

  //UserAccountsQueryList
  RxList<ModUserAccountsQuery>? l_PrUserAccountsQueryList = <ModUserAccountsQuery>[].obs;
  Future<bool> Fnc_UserAccountQueryList() async {
    List<ModUserAccountsQuery>? lListUserAccountsQuery = List<ModUserAccountsQuery>.empty(growable: true);
    lListUserAccountsQuery = await Sl_UserAccountsQuery().Fnc_UserAccountsQuery();
    {
      l_PrUserAccountsQueryList?.addAll(lListUserAccountsQuery!);

      if (l_PrUserAccountsQueryList == null) {
        return false;
      }
      cmGlobalVariables.Pb_AccountsDID = l_PrUserAccountsQueryList![0].Pr_AccountsDID;
      print(cmGlobalVariables.Pb_AccountsDID);
      print(cmGlobalVariables.Pb_AccountsDID);
      //Fnc_AccLedgerList();
    }
    return true;
  }

  void FncClearAllDATA() {
    cmGlobalVariables.Pb_Token = "";
    cmGlobalVariables.Pb_UserDID = "";
    cmGlobalVariables.Pb_UserName = "";
    cmGlobalVariables.Pb_UserImage = "";
    cmGlobalVariables.Pb_UserEmail = "";
    cmGlobalVariables.Pb_UserNumber = "";
    cmGlobalVariables.Pb_Report = "";
    cmGlobalVariables.PbSelectedBranch = 0;
    cmGlobalVariables.PbDefaultBranch = 0;
    cmGlobalVariables.PbCount = 0;
    cmGlobalVariables.Pb_SelectedDID = "";
    cmGlobalVariables.Pb_jsonString = "";

  }
}
