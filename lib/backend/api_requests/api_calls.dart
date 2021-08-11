import 'api_manager.dart';

Future<dynamic> usersCall() => ApiManager.instance.makeApiCall(
      callName: 'users',
      apiDomain: 'stocktrader1-a86f8-default-rtdb.firebaseio.com',
      apiEndpoint: '',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      returnResponse: true,
    );
