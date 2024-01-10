import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';
import 'package:pine/pine.dart';

class UserMapper extends DTOMapper<UserDTO, User> {
  @override
  User fromDTO(UserDTO dto) => User(
        userId: dto.data!.userId != null ? int.parse(dto.data!.userId!) : 0,
        firstName: dto.data!.firstName ?? '',
        lastName: dto.data!.lastName ?? '',
        email: dto.data!.email ?? '',
        token: dto.data!.token ?? '',
        tokenExpiration: dto.data!.tokenExpiration ?? '',
      );

  @override
  UserDTO toDTO(User model) => UserDTO(
        data: UserDetailDTO(
          userId: model.userId.toString(),
          firstName: model.firstName,
          lastName: model.lastName,
          email: model.email,
          token: model.token,
          tokenExpiration: model.tokenExpiration,
        ),
        status:
            null, // Assumendo che result e message siano opzionali e non utilizzati in questa trasformazione.
        code: null,
      );
}
