import 'dart:io';
import 'dart:ui';

import 'package:http/http.dart' as http;

import 'cmGlobalVariables.dart';

class cmHttpCalls {
  //Fnc_HttpResponseWebLogin,---- //
  Future<http.Response> Fnc_HttpResponseWeb(
      String l_controllerUrl, List<int> l_UtfContent) async {
    Uri l_uri = Uri.https(cmGlobalVariables.Pb_WebAPIURL, l_controllerUrl);
    Map<String, String> l_stringContect = {
      //HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    };
    final l_response =
    await http.post(l_uri, headers: l_stringContect, body: l_UtfContent);
    return l_response;
  }

  Future<http.Response> Fnc_HttpResponseERPBoth(
      String l_controllerUrl, List<int> l_UtfContent) async {
    String? l_token;
    l_token = cmGlobalVariables.Pb_Token;

    String BaseURL, DynamicURL, URL;
    BaseURL = cmGlobalVariables.Pb_ERPApiUrl!;
    DynamicURL = l_controllerUrl;
    URL = BaseURL + DynamicURL;

    late Uri l_uri;
    if (cmGlobalVariables.Pb_ERPApiUrl == cmGlobalVariables.Pb_ERP_API) {
      l_uri = Uri.http(cmGlobalVariables.Pb_ERPApiUrl!, l_controllerUrl);
      print(l_uri);
    } else {
      l_uri = Uri.parse(URL);
      print(l_uri);
    }

    Map<String, String> l_stringContect = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.authorizationHeader: 'Bearer $l_token',
    };
    final l_response =
    await http.post(l_uri, headers: l_stringContect, body: l_UtfContent);
    return l_response;
  }



}
