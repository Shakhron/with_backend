import 'dart:io';

import 'package:auth/models/user.dart';
import 'package:auth/utils/app_const.dart';
import 'package:auth/utils/app_response.dart';
import 'package:auth/utils/app_utils.dart';
import 'package:conduit_core/conduit_core.dart';

class AppUserController extends ResourceController {
  final ManagedContext managedContext;

  AppUserController(this.managedContext);

  @Operation.get()
  Future<Response> getProfile(
      @Bind.header(HttpHeaders.authorizationHeader) String header) async {
    try {
      final id = AppUtils.getIdFromHeader(header);
      final user = await managedContext.fetchObjectWithID<User>(id);
      user?.removePropertiesFromBackingMap(
          [AppConst.accessToken, AppConst.refreshToken]);
      return AppResponse.ok(
          message: "Успешное получение профиля", body: user?.backing.contents);
    } catch (error) {
      return AppResponse.serverError(error,
          message: "Ошибка получение профиля");
    }
  }

  @Operation.post()
  Future<Response> updateProfile(
      @Bind.header(HttpHeaders.authorizationHeader) String header,
      @Bind.body() User user) async {
    try {
      final id = AppUtils.getIdFromHeader(header);
      final fetchedUser = await managedContext.fetchObjectWithID<User>(id);
      final qUpdateUser = Query<User>(managedContext)
        ..where((x) => x.id).equalTo(id)
        ..values.username = user.username ?? fetchedUser?.username
        ..values.email = user.email ?? fetchedUser?.email;
      await qUpdateUser.updateOne();
      final updatedUser = await managedContext.fetchObjectWithID<User>(id);
      updatedUser?.removePropertiesFromBackingMap(
          [AppConst.accessToken, AppConst.refreshToken]);
      return AppResponse.ok(
          message: "Успешное обновление данных",
          body: updatedUser?.backing.contents);
    } catch (error) {
      return AppResponse.serverError(error,
          message: "Ошибка обновление данных");
    }
  }

  @Operation.put()
  Future<Response> updatePassword() async {
    try {
      return AppResponse.ok(message: "updatePassword");
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }
}
