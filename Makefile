setup:
	@dart pub global activate flutter_gen

gen:
	@flutter packages pub run build_runner build