import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/repostiories/user_profile_repository.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_profile.dart';

class UserProfileRepositoryMock extends Mock implements UserProfileRepository {}

void main() {
  final repository = UserProfileRepositoryMock();
  final usecase = GetUserProfile(repository);
  const userEntity = UserEntity(
      name: "Yhan Nunes",
      avatar: "https://avatars.githubusercontent.com/u/51480561?v=4",
      nick: "Yhan17",
      bio: "Just a Developer.");
  test('Deve retornar um perfil no git', () async {
    when(repository.getUserProfile("Yhan17"))
        .thenAnswer((_) async => const Right(userEntity));

    final result = await usecase("Yhan17");
    expect(result, const Right(userEntity));
  });
}
