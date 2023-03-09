import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModAssignedBranches.dart';
import 'package:customercare/MVVM/ViewModel/VmCompany.dart';
import 'package:get/get.dart';

class VmAssignedBranches extends GetxController {
  final VmCompany G_VmCompany = Get.find();

  RxList<ModAssignedBranches>? l_PrAssignedBranchesList =
      <ModAssignedBranches>[].obs;

  late RxInt l_PrselectedIndex = 0.obs;

  RxInt get Pr_txtselectedIndex_Text {
    return l_PrselectedIndex;
  }set Pr_txtselectedIndex_Text(RxInt value) {
    l_PrselectedIndex = value;

  }
  bool l_PrisFolded = false;

  bool get Pr_boolisFolded_wid {
    return l_PrisFolded;
  }


  void Fnc_addItem() {
    if (l_PrAssignedBranchesList?.isEmpty ?? true) {
      l_PrAssignedBranchesList?.addAll(G_VmCompany.l_PrAssignedBranchesList!);
    }
  }



  void FncSelectedBranch()
  {
    cmGlobalVariables.PbSelectedBranch =l_PrAssignedBranchesList![l_PrselectedIndex.value].pr_BranchDID;
  }


}