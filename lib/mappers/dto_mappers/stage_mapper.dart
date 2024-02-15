import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/services/dto/stage_list_dto.dart';
import 'package:pine/pine.dart';

class StageListMapper extends DTOMapper<StageListDTO, StagesList> {
  @override
  // ignore: prefer_if_null_operators
  StagesList fromDTO(StageListDTO dto) {
    List<Stage> stages = [];
    StageMapper playerMapper = new StageMapper();
    if (dto.data != null) {
      dto.data!.forEach((element) {
        stages.add(playerMapper.fromDTO(element));
      });
    }
    return StagesList(count: dto.data?.length ?? 0, stages: stages);
  }

  @override
  StageListDTO toDTO(StagesList model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}

class StageMapper extends DTOMapper<StageDTO, Stage> {
  @override
  Stage fromDTO(StageDTO dto) {

    return Stage(
    id: int.parse(dto.id!),
    city: dto.nome ?? '',
    fieldName: dto.nome ?? '',
    address: dto.nome ?? '',
    openingDate: dto.dataInizio ?? '',
    matchDate: dto.dataInizio ?? '',
    closingDate: dto.dataInizio ?? '',
  );
  }

  @override
  StageDTO toDTO(Stage model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}