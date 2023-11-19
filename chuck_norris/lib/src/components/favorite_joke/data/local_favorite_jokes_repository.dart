import 'package:chuck_norris/src/dtos/joke_dto.dart';
import 'package:chuck_norris/src/components/favorite_joke/interfaces/favorite_jokes_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalFavoriteJokesRepository implements FavoriteJokesRepository {
  late Database _database;

  Future open() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'favorite_jokes_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id TEXT PRIMARY KEY, categories TEXT, created_at TEXT, icon_url TEXT, updated_at TEXT, url TEXT, value TEXT)',
        );
      },
      version: 1,
    );
  }

  Future close() async => _database.close();

  @override
  Future<void> addJokeToFavorites(Map<String, dynamic> joke) async {
    await open();
    await _database.insert(
      'favorites',
      joke,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<JokeDTO>> getJokes() async {
    await open();
    final List<Map<String, dynamic>> maps = await _database.query('favorites');

    return List.generate(maps.length, (i) {
      return JokeDTO.fromJson(maps[i], isFromLocal: true);
    });
  }

  @override
  Future<void> removeJokeFromFavorites(String id) async {
    await open();
    await _database.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<bool> isFavorite(String id) async {
    await open();
    final count = Sqflite.firstIntValue(
          await _database
              .rawQuery('SELECT COUNT(*) FROM favorites WHERE id = ?', [id]),
        ) ??
        0;
    return count > 0;
  }

  @override
  Future<void> clearAllFavorites() async {
    await open();
    await _database.delete('favorites');
  }
}
