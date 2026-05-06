import 'package:equatable/equatable.dart';

class MetadataEntity extends Equatable {
  final String role;
  final String city;

  const MetadataEntity({required this.role, required this.city});

  MetadataEntity copyWith({String? role, String? city}) {
    return MetadataEntity(role: role ?? this.role, city: city ?? this.city);
  }

  factory MetadataEntity.empty() {
    return MetadataEntity(role: '', city: '');
  }
  @override
  String toString() => 'MetadataEntity(role: $role, city: $city)';
  @override
  List<Object?> get props => [role, city];
}
