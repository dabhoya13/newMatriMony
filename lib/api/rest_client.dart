import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://638029948efcfcedacfe0228.mockapi.io/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/user")
  Future<String> getUsers();

  @GET("/user")
  Future<String> getUsersByID(@Query('UserID') id);

  @POST("/user")
  @FormUrlEncoded()
  Future<String> addUser(
      @Field('name') name, @Field('Dob') dob, @Field('City') City);


}

