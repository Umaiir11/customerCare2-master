import 'dart:io';

import 'package:http/http.dart' as http;

import 'cmGlobalVariables.dart';

class cmHttpCalls {
  //Fnc_HttpResponseWebLogin,---- //
  Future<http.Response> Fnc_HttpResponseWeb(
      String lControllerUrl, List<int> lUtfContent) async {
    Uri lUri = Uri.https(cmGlobalVariables.Pb_WebAPIURL, lControllerUrl);
    Map<String, String> lStringContect = {
      //HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    };
    final lResponse =
    await http.post(lUri, headers: lStringContect, body: lUtfContent);
    return lResponse;
  }

  Future<http.Response> Fnc_HttpResponseERPBoth(
      String lControllerUrl, List<int> lUtfContent) async {
    String? lToken;
    lToken = cmGlobalVariables.Pb_Token;

    String BaseURL, DynamicURL, URL;
    BaseURL = cmGlobalVariables.Pb_ERPApiUrl!;
    DynamicURL = lControllerUrl;
    URL = BaseURL + DynamicURL;

    late Uri lUri;
    if (cmGlobalVariables.Pb_ERPApiUrl == cmGlobalVariables.Pb_ERP_API) {
      lUri = Uri.http(cmGlobalVariables.Pb_ERPApiUrl!, lControllerUrl);
      print(lUri);
    } else {
      lUri = Uri.parse(URL);
      print(lUri);
    }

    Map<String, String> lStringContect = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.authorizationHeader: 'Bearer $lToken',
    };
    final lResponse =
    await http.post(lUri, headers: lStringContect, body: lUtfContent);
    return lResponse;
  }



}
