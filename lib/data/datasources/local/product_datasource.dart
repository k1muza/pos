import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/product_dao.dart';
import 'package:pos_meat_shop/data/datasources/I_product_datasource.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

class ProductLocalDataSourceImpl implements IProductDataSource {
  final ProductDao _productDao;

  ProductLocalDataSourceImpl(this._productDao);

  @override
  Stream<List<Product>> watchAllProducts() => _productDao.watchAllProducts();

  @override
  Future<List<Product>> getAllProducts() => _productDao.getAllProducts();

  @override
  Future<Product?> getProductById(productId) => _productDao.getProductById(productId);

  @override
  Future<void> addProduct(ProductsCompanion product) => _productDao.insertProduct(product);

  @override
  Future<bool> updateProduct(ProductsCompanion product ) => _productDao.updateProductData(product);

  @override
  Future<int> deleteProduct(String id) => _productDao.deleteProduct(id);
}
