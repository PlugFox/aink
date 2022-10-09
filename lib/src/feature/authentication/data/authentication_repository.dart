import '../model/user_entity.dart';
import 'authentication_provider.dart';

abstract class IAuthenticationRepository {
  UserEntity get currentUser;

  Stream<UserEntity> get userChanges;

  Future<UserEntity> signInWithGoogle();

  Future<UserEntity> signInWithGitHub();

  Future<void> logOut();
}

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  AuthenticationRepositoryImpl({required IAuthenticationProvider authenticationProvider})
      : _authenticationProvider = authenticationProvider;

  final IAuthenticationProvider _authenticationProvider;

  @override
  UserEntity get currentUser => UserEntity.fromFirebase(_authenticationProvider.currentUser);

  @override
  Stream<UserEntity> get userChanges => _authenticationProvider.userChanges.map<UserEntity>(UserEntity.fromFirebase);

  @override
  Future<UserEntity> signInWithGoogle() => _authenticationProvider.signInWithGoogle().then<UserEntity>(
        (userCredential) => UserEntity.fromFirebase(userCredential.user),
      );

  @override
  Future<UserEntity> signInWithGitHub() => _authenticationProvider.signInWithGitHub().then<UserEntity>(
        (userCredential) => UserEntity.fromFirebase(userCredential.user),
      );

  @override
  Future<void> logOut() => _authenticationProvider.logOut();
}
