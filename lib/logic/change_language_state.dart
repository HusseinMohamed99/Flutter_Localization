import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_language_state.freezed.dart';

@freezed
class ChangeLanguageState<T> with _$ChangeLanguageState<T> {
  const factory ChangeLanguageState.initial() = _Initial;
  const factory ChangeLanguageState.loading() = Loading;
  const factory ChangeLanguageState.loaded({required String language}) = Loaded;
  const factory ChangeLanguageState.error() = Error;
}
