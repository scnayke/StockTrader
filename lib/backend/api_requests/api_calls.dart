import 'api_manager.dart';

Future<dynamic> companyCall() => ApiManager.instance.makeApiCall(
      callName: 'company',
      apiDomain: 'localhost:5000',
      apiEndpoint: 'company',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );
