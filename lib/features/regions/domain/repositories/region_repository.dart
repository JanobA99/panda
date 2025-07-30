import 'package:dartz/dartz.dart';
import '../../../../core/domain/failures/failures.dart';
import '../entities/region.dart';

abstract class RegionRepository {
  Future<Either<Failure, List<Region>>> getRegions();
  Future<Either<Failure, Region>> getRegionById(String id);
  Future<Either<Failure, List<Region>>> searchRegions(String query);
} 