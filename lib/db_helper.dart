import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pth;

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = pth.join(databasesPath, 'user.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY, username TEXT, password TEXT, phone TEXT, email TEXT, address TEXT)');
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    return await dbClient.insert('user', user.toMap());
  }

  Future<User?> getUser() async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query('user', limit: 1);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }
}

class User {
  int? id;
  String username;
  String password;
  String phone;
  String email;
  String address;

  User(this.id, this.username, this.password, this.phone, this.email,
      this.address);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'],
      map['username'],
      map['password'],
      map['phone'],
      map['email'],
      map['address'],
    );
  }
}
