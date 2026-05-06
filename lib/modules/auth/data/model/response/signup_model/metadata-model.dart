import 'package:delivery_app/modules/auth/domain/entities/signup-entities/metadata_entity.dart';

class MetadataModel {
  final String? role;
  final String? city;

  MetadataModel({this.role, this.city});

  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(role: json['role'], city: json['city']);
  }

  Map<String, dynamic> toJson() => {'role': role, 'city': city};
  MetadataModel copyWith({String? role, String? city}) {
    return MetadataModel(role: role ?? this.role, city: city ?? this.city);
  }

  MetadataEntity toEntity() {
    return MetadataEntity(role: role ?? '', city: city ?? '');
  }
}
