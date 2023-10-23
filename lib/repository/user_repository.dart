import 'package:dio/dio.dart';
import 'package:my_todo_riverpod_v1/models/user.dart';
import 'dart:convert';

import 'package:my_todo_riverpod_v1/repository/entity/user_entity.dart';

// "Repository"는 일반적으로 데이터의 추상화 레이어로 사용됩니다.
// (예: 로컬 데이터베이스, 원격 서버, 캐시)을 추상화
// Repository 패턴은 소비자 코드에서 데이터의 원본을 신경 쓰지 않도록 도와줍니다.
// 통신을 담당 + 파싱(모델링 처리)
class UserRepository {
  final Dio _dio = Dio();

  // 정적 변수를 선언하며 UserRepository 클래스의 인스턴스를 저장합니다.
  // 이 변수는 클래스 레벨에서 하나의 인스턴스만 가질 수 있도록 정의됩니다.
  static final UserRepository _singleton = UserRepository._internal();

  factory UserRepository() {
    return _singleton;
  }

  //_internal 은 싱글톤 패턴에서 내부적으로 사용되는 생성자의 이름을 보통 _internal로 짓는 관례입니다
  // 생성자를 private 처리
  // 이렇게 하면 클래스의 사용자는 싱글톤 객체를 생성하거나 초기화하는 데
  // 사용되는 생성자에 직접 접근할 수 없으며, 팩토리 메서드(factory)를 통해서만 인스턴스를 얻을 수 있습니다.
  UserRepository._internal();

  Future<UserDto> signUp(UserDto userDto) async {
    var baseURI = "https://jsonplaceholder.typicode.com/";
    final response = await _dio.post(baseURI,
        data: userDto,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    final data = response.data;
    print('data value check : ${data}');
    print('data value type : ${data.runtimeType}');
    return data;
  }

  Future<Response> signin() async {
    //샘플
    UserDto userDto =
        UserDto(username: 'hong@example.com', password: 'honga1234');
    userDto.email = 'hong@exmple.com';
    userDto.password = 'honga1234';
    // 자신에 IP 주소 작성(ipConfig)
    var baseURI = "http://192.168.0.22:80/api/user/signin";
    final postData = {"email": "hong@example.com", "password": "hong1234"};
    final response = await _dio.post(baseURI,
        data: postData,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    print("response : ${response.headers}");
    print("response : ${response.statusCode}");
    print("response : ${response.data}");
    print("response : ${response.data.runtimeType}");

    // Parse the JSON string to a Map
    Map<String, dynamic> bodyData = json.decode(response.data);
    response.data = UserEntity.fromJson(bodyData);

    return response;
  }
}

/**
 * 객체를 생성할 때 인스턴스를 새로 생성하지 않아도 되는 경우:
 *    일반 생성자를 사용하면 항상 새로운 객체 인스턴스가 생성됩니다.
 *    그러나 factory 생성자를 사용하면 생성된 객체를 다시
 *    사용하거나 캐싱할 수 있습니다.
 *
 * 단일 인스턴스 패턴 (싱글톤):
 *   factory 생성자는 싱글톤 패턴을 구현하는 데 사용됩니다.
 *   예를 들어, 동일한 클래스에서 여러 요청에서 하나의
 *   인스턴스를 공유하려면 factory 생성자를 사용하여
 *   인스턴스를 캐싱하거나 재사용할 수 있습니다.
 */
