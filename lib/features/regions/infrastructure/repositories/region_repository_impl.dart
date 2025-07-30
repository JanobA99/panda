import 'package:dartz/dartz.dart';
import '../../../../core/domain/failures/failures.dart';
import '../../domain/entities/region.dart';
import '../../domain/repositories/region_repository.dart';
import '../datasources/region_remote_datasource.dart';

class RegionRepositoryImpl implements RegionRepository {
  final RegionRemoteDataSource remoteDataSource;

  const RegionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Region>>> getRegions() async {
    try {
      final regions = await remoteDataSource.getRegions();
      return Right(regions);
    } catch (e) {
      return Left(ServerFailure('Failed to load regions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Region>> getRegionById(String id) async {
    try {
      final region = await remoteDataSource.getRegionById(id);
      if (region != null) {
        return Right(region);
      } else {
        return Left(ValidationFailure('Region not found'));
      }
    } catch (e) {
      return Left(ServerFailure('Failed to load region: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Region>>> searchRegions(String query) async {
    try {
      final regions = await remoteDataSource.searchRegions(query);
      return Right(regions);
    } catch (e) {
      return Left(ServerFailure('Failed to search regions: ${e.toString()}'));
    }
  }
} 