setup:
	@flutter pub get
	@dart pub global activate flutter_gen
	@make gen

gen:
	@dart run build_runner build --delete-conflicting-outputs --verbose --no-release

watch:
	@dart run build_runner watch --delete-conflicting-outputs