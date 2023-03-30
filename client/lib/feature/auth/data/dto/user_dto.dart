import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';


@JsonSerializable()
class UserDto {
  final dynamic id;
  final dynamic username;
  final dynamic email;
  final dynamic accessToken;
  final dynamic refreshToken;
  
  UserDto({
    required this.id,
    required this.username,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
