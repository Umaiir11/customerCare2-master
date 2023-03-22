import 'dart:convert';

import 'package:customercare/ClassModules/cmHttpCalls.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModCompanyURLs.dart';
import 'package:customercare/MVVM/Model/ParameterModels/ParModUserLogin.dart';

class Sl_CompanyURLs {
  Future<ModCompanyURLs?> Fnc_CompanyURls(
      String name, String pass, String uuid) async {
    try {
      ParModUserProfile lParModUserProfile = ParModUserProfile(
          Pr_EmailID: name,
          Pr_Password: pass,
          Pr_CompanyDID: uuid);

      String lJsonString = json.encode((lParModUserProfile.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls()
          .Fnc_HttpResponseWeb('/apiUser/ApiCompanyURLs/Post', lUtfContent);
      print(lResponse);
      if (lResponse.statusCode == 200) {
        return Fnc_JsonToModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModCompanyURLs Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModCompanyURLs lModCompanyURLs = ModCompanyURLs();
    lModCompanyURLs.Pr_ApiErpUrl = lJsonObject["Pr_ApiErpUrl"];
    lModCompanyURLs.Pr_ApiRepServerUrl = lJsonObject["Pr_ApiRepServerUrl"];
    lModCompanyURLs.Pr_PKGUID = lJsonObject["Pr_PKGUID"];
    lModCompanyURLs.Pr_Token = lJsonObject["Pr_Token"];
    lModCompanyURLs.Pr_WebErpUrl = lJsonObject["Pr_WebErpUrl"];

    return lModCompanyURLs;
  }

  List<ModCompanyURLs> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    //Declare Local Variable For list Of Model and instance

    List<ModCompanyURLs> lListCompanyURLs =
        List<ModCompanyURLs>.empty(growable: true);

    //Start Irritation From Json String

    for (dynamic lJsonObject in lJsonList) {
      ModCompanyURLs lModCompanyURLs = ModCompanyURLs();
      lModCompanyURLs = Fnc_JsonToModel(lJsonObject);
      lListCompanyURLs.add(lModCompanyURLs);
    }
    return lListCompanyURLs;
  }
}
