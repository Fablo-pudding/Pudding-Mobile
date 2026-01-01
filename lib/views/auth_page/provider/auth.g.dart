// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signUp)
const signUpProvider = SignUpFamily._();

final class SignUpProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const SignUpProvider._({
    required SignUpFamily super.from,
    required ({String name, String password}) super.argument,
  }) : super(
         retry: null,
         name: r'signUpProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$signUpHash();

  @override
  String toString() {
    return r'signUpProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({String name, String password});
    return signUp(ref, name: argument.name, password: argument.password);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$signUpHash() => r'741fea3385a3682ead0d66c6dbbefa7e8bc7887e';

final class SignUpFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<bool>,
          ({String name, String password})
        > {
  const SignUpFamily._()
    : super(
        retry: null,
        name: r'signUpProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SignUpProvider call({required String name, required String password}) =>
      SignUpProvider._(argument: (name: name, password: password), from: this);

  @override
  String toString() => r'signUpProvider';
}

@ProviderFor(signIn)
const signInProvider = SignInFamily._();

final class SignInProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const SignInProvider._({
    required SignInFamily super.from,
    required ({String name, String password}) super.argument,
  }) : super(
         retry: null,
         name: r'signInProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$signInHash();

  @override
  String toString() {
    return r'signInProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({String name, String password});
    return signIn(ref, name: argument.name, password: argument.password);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$signInHash() => r'e5fb8742b5d810518bb048b6e6bf39edbb159df8';

final class SignInFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<bool>,
          ({String name, String password})
        > {
  const SignInFamily._()
    : super(
        retry: null,
        name: r'signInProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SignInProvider call({required String name, required String password}) =>
      SignInProvider._(argument: (name: name, password: password), from: this);

  @override
  String toString() => r'signInProvider';
}

@ProviderFor(myInfo)
const myInfoProvider = MyInfoProvider._();

final class MyInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<InfoResponse>,
          InfoResponse,
          FutureOr<InfoResponse>
        >
    with $FutureModifier<InfoResponse>, $FutureProvider<InfoResponse> {
  const MyInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myInfoHash();

  @$internal
  @override
  $FutureProviderElement<InfoResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<InfoResponse> create(Ref ref) {
    return myInfo(ref);
  }
}

String _$myInfoHash() => r'46c5dab80ad861ceea73db6a53f1c2f631df580e';
