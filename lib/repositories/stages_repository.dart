import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/network/stage_service/stage_service.dart';
import 'package:fantabasket_app_flutter/services/dto/stage_list_dto.dart';
import 'package:logger/logger.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:retrofit/retrofit.dart';

class StagesRepository {
  final StageService stageService;
  final DTOMapper<StageListDTO, StagesList> stageDTOMapper;
  final Logger logger;

  StagesRepository(
      {required this.stageService,
      required this.logger,
      required this.stageDTOMapper});

  Future<HttpResponse<StagesList>> getStages() async {
    try {
      final response = await stageService.getStages();
      StagesList stagesList = stageDTOMapper.fromDTO(response.data);
      return HttpResponse(stagesList, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting list of stage',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
