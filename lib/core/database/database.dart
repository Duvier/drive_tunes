abstract interface class Database {
  Future<void> initialize();

  Future<void> close();
}
