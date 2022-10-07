import 'package:chopper/chopper.dart';
import 'package:programming_hero_quiz/core/utils/constants.dart';

part "rest_client_service.chopper.dart";

@ChopperApi(baseUrl: API_BASE_URL)
abstract class RestClientService extends ChopperService {
  static RestClientService create([ChopperClient? client]) => _$RestClientService(client);

  //Get requests
  @Get(path: '/quiz.json')
  Future<Response> getQuestions();

  //Post requests
  // @Post(path: '/withdrawalRequest')
  // Future<Response> sendWithdrawalRequest(@Query() String vendorID, @Body() String body);

}
