import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final String id;
  final String name;
  final String nameEn;
  final String nameRu;
  final String nameUz;
  final String code;
  final bool isActive;

  const Region({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.nameRu,
    required this.nameUz,
    required this.code,
    this.isActive = true,
  });

  String getNameByLanguage(String languageCode) {
    switch (languageCode) {
      case 'en':
        return nameEn;
      case 'ru':
        return nameRu;
      case 'uz':
        return nameUz;
      default:
        return nameEn;
    }
  }

  @override
  List<Object?> get props => [id, name, nameEn, nameRu, nameUz, code, isActive];
} 