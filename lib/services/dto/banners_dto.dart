import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class BannerListDTO extends DTO with EquatableMixin {
  List<BannerDTO>? banners;
  bool? status;
  String? msg;

  BannerListDTO({this.banners, this.status, this.msg});

  BannerListDTO.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannerDTO>[];
      json['banners'].forEach((v) {
        banners!.add(new BannerDTO.fromJson(v));
      });
    }
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [banners, status, msg];
}

class BannerDTO extends DTO with EquatableMixin {
  String? nome;
  String? foto;

  BannerDTO({this.nome, this.foto});

  BannerDTO.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['foto'] = this.foto;
    return data;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [nome, foto];
}