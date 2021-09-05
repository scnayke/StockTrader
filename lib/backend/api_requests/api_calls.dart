import 'api_manager.dart';

Future<dynamic> usersCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'users',
    apiUrl: 'https://stocktrader1-a86f8-default-rtdb.firebaseio.com/',
    callType: ApiCallType.POST,
    headers: {},
    params: {},
    bodyType: BodyType.JSON,
    returnResponse: true,
  );
}

Future<dynamic> buyOrSellCall({
  String objectID = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'BuyOrSell',
    apiUrl: 'https://predictlogreg1.herokuapp.com/predict/$objectID',
    callType: ApiCallType.GET,
    headers: {},
    params: {},
    returnResponse: true,
  );
}
