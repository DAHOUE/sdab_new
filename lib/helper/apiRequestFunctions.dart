import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';


Future<List> updateFiches({String urlApi,data,headers}) async {

  try {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    final url = Uri.parse(urlApi);

    final response = await http.put(url,body:data,headers: headers );

    return [json.decode(response.body)];
  } catch (e) {
    print(e.toString());
    return [{
      "success":false,
      'error':'Vérifiez votre connexion'
    }];
  }

}

Future<List> saveFiches({String urlApi,data,headers}) async {

  try {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    final url = Uri.parse(urlApi);

    final response = await http.post(url,body:data,headers: headers );

    return [json.decode(response.body)];
  } catch (e) {
    print(e.toString());
    return [{
      "success":false,
      'error':'Vérifiez votre connexion'
    }];
  }

}


Future<List> getFiches({String urlApi,headers}) async {

  try {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    final url = Uri.parse(urlApi);

    final response = await http.get(url,headers: headers );

    return [json.decode(response.body)];
  } catch (e) {
    print(e.toString());
    return [{
      "success":false,
      'error':'Vérifiez votre connexion'
    }];
  }

}

Future<List> deleteFiches({String urlApi,int id,headers}) async {

  try {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    final url = Uri.parse(urlApi+'$id');

    final response = await http.delete(url,headers: headers);

    return [json.decode(response.body)];
  } catch (e) {
    print(e.toString());
    return [{
      "success":false,
      'error':'Vérifiez votre connexion'
    }];
  }

}