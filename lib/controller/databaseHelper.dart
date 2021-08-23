import 'package:sqflite/sqflite.dart';
import '../model/product.dart';
import 'package:path/path.dart';
import 'dart:async';

class databaseHelper{
  String productTable = 'product';
  String id        = 'id';
  String name      = 'name';
  String reference = 'reference';
  String quantity  = 'quantity';
  String length    = 'length';
  String width     = 'width';
  String height    = 'height';
  String price     = 'price';
 // String mesure   = 'mesure';

  static Database _db;

  Future<Database> get db async{
    if (_db!=null){
      return _db;
    }
    _db=await intDB();
    return _db;
  }

  intDB()async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, "mydb.db");
    Future<Database> dbb = openDatabase(path, version: 1, onCreate: oncreate);
    return dbb;
  }
  oncreate(Database db, int newVersion)async{
    String sql = "CREATE TABLE $productTable($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, $reference TEXT, $length Double, $width Double," +
                 "$height DOUBLE, $price  DOUBLE,$quantity DOUBLE)";
    await db.execute(sql);
  }
  // add product
  Future<int> addProduct(Product Product )  async{
    var dbClient = await db;
    var result   = await dbClient.insert(productTable, Product.tomap(),  conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }
  //delete product
  Future<int> deleteProduct(int id)  async{
    Database dbClient= await db;
    int result =await dbClient.delete(productTable,where:'$id=?',whereArgs: [id] );
    return result;
  }
  //get all product
  Future<List<Product>> getAllProduct() async{
    Database dbClient= await db;
    List<Map<String, dynamic>>  result = await dbClient.query(productTable,);
    List<Product> ListPrd = result.map((itemPrd) => Product.fromMap(itemPrd)).toList();

    return ListPrd;
  }
  //get products count
  Future<int> getProductCount()async{
    Database dbClient= await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM  $productTable'));
  }
}