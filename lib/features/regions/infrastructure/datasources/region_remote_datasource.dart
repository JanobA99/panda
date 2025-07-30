import 'package:dio/dio.dart';
import '../../domain/entities/region.dart';

abstract class RegionRemoteDataSource {
  Future<List<Region>> getRegions();
  Future<Region?> getRegionById(String id);
  Future<List<Region>> searchRegions(String query);
}

class RegionRemoteDataSourceImpl implements RegionRemoteDataSource {
  final Dio dio;

  RegionRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Region>> getRegions() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return fake data as if from API
    return [
      const Region(
        id: '1',
        name: 'Andijan Region',
        nameEn: 'Andijan Region',
        nameRu: 'Андижанская область',
        nameUz: 'Andijon viloyati',
        code: 'AN',
      ),
      const Region(
        id: '2',
        name: 'Bukhara Region',
        nameEn: 'Bukhara Region',
        nameRu: 'Бухарская область',
        nameUz: 'Buxoro viloyati',
        code: 'BU',
      ),
      const Region(
        id: '3',
        name: 'Jizzakh Region',
        nameEn: 'Jizzakh Region',
        nameRu: 'Джизахская область',
        nameUz: 'Jizzax viloyati',
        code: 'JI',
      ),
      const Region(
        id: '4',
        name: 'Karakalpakstan',
        nameEn: 'Karakalpakstan',
        nameRu: 'Каракалпакстан',
        nameUz: 'Qoraqalpog\'iston',
        code: 'QR',
      ),
      const Region(
        id: '5',
        name: 'Navoiy Region',
        nameEn: 'Navoiy Region',
        nameRu: 'Навойиская область',
        nameUz: 'Navoiy viloyati',
        code: 'NA',
      ),
      const Region(
        id: '6',
        name: 'Samarkand Region',
        nameEn: 'Samarkand Region',
        nameRu: 'Самаркадская область',
        nameUz: 'Samarqand viloyati',
        code: 'SA',
      ),
      const Region(
        id: '7',
        name: 'Tashkent Region',
        nameEn: 'Tashkent Region',
        nameRu: 'Ташкентская область',
        nameUz: 'Toshkent viloyati',
        code: 'TO',
      ),
      const Region(
        id: '8',
        name: 'Namangan Region',
        nameEn: 'Namangan Region',
        nameRu: 'Наманганская область',
        nameUz: 'Namangan viloyati',
        code: 'NM',
      ),
      const Region(
        id: '9',
        name: 'Fergana Region',
        nameEn: 'Fergana Region',
        nameRu: 'Ферганская область',
        nameUz: 'Farg\'ona viloyati',
        code: 'FA',
      ),
      const Region(
        id: '10',
        name: 'Khorezm Region',
        nameEn: 'Khorezm Region',
        nameRu: 'Хорезмская область',
        nameUz: 'Xorazm viloyati',
        code: 'XO',
      ),
      const Region(
        id: '11',
        name: 'Surkhandarya Region',
        nameEn: 'Surkhandarya Region',
        nameRu: 'Сурхандарьинская область',
        nameUz: 'Surxondaryo viloyati',
        code: 'SU',
      ),
      const Region(
        id: '12',
        name: 'Syrdarya Region',
        nameEn: 'Syrdarya Region',
        nameRu: 'Сырдарьинская область',
        nameUz: 'Sirdaryo viloyati',
        code: 'SI',
      ),
    ];
  }

  @override
  Future<Region?> getRegionById(String id) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    final regions = await getRegions();
    try {
      return regions.firstWhere((region) => region.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Region>> searchRegions(String query) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 200));
    
    final regions = await getRegions();
    if (query.isEmpty) return regions;
    
    return regions.where((region) {
      final searchQuery = query.toLowerCase();
      return region.nameEn.toLowerCase().contains(searchQuery) ||
             region.nameRu.toLowerCase().contains(searchQuery) ||
             region.nameUz.toLowerCase().contains(searchQuery) ||
             region.code.toLowerCase().contains(searchQuery);
    }).toList();
  }
} 