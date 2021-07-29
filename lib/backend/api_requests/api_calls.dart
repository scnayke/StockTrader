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

Future<dynamic> usersCall() => ApiManager.instance.makeApiCall(
      callName: 'users',
      apiDomain: 'stocktrader1-a86f8-default-rtdb.firebaseio.com',
      apiEndpoint: '',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      returnResponse: true,
    );
