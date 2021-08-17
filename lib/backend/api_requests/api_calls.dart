import 'api_manager.dart';

Future<dynamic> usersCall() => ApiManager.instance.makeApiCall(
      callName: 'users',
      apiUrl: 'https://stocktrader1-a86f8-default-rtdb.firebaseio.com/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      returnResponse: true,
    );
