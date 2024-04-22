import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/bloc/add_team_bloc/add_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/mappers/dto_mappers/player_dto_mapper.dart';
import 'package:fantabasket_app_flutter/mappers/dto_mappers/stage_mapper.dart';
import 'package:fantabasket_app_flutter/mappers/dto_mappers/team_dto_mapper.dart';
import 'package:fantabasket_app_flutter/mappers/dto_mappers/user_dto_mapper.dart';
import 'package:fantabasket_app_flutter/mappers/string_mappers/user_to_string_mapper.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/model/team.dart';
import 'package:fantabasket_app_flutter/model/team_list.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/network/interceptors/auth_interceptors.dart';
import 'package:fantabasket_app_flutter/network/player_service/player_service.dart';
import 'package:fantabasket_app_flutter/network/stage_service/stage_service.dart';
import 'package:fantabasket_app_flutter/network/team_service/team_service.dart';
import 'package:fantabasket_app_flutter/network/user_service/user_service.dart';
import 'package:fantabasket_app_flutter/repositories/player_repository.dart';
import 'package:fantabasket_app_flutter/repositories/stages_repository.dart';
import 'package:fantabasket_app_flutter/repositories/user_repository.dart';
import 'package:fantabasket_app_flutter/repositories/team_repository.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/stage_list_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/team_list_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:pine/utils/mapper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'blocs.dart';
part 'mappers.dart';
part 'providers.dart';
part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
      providers: _providers,
      blocs: _blocs,
      mappers: _mappers,
      repositories: _repositories,
      child: child);
}
