import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/product_dao.dart';
import 'package:pos_meat_shop/data/repos/I_product_repo.dart';

class ProductRepository implements IProductRepository {
  final ProductDao _productDao;

  ProductRepository(this._productDao);

  @override
  Stream<List<Product>> watchAllProducts() => _productDao.watchAllProducts();

  @override
  Future<List<Product>> getAllProducts() => _productDao.getAllProducts();

  @override
  Future<Product?> getProductById(productId) => _productDao.getProductById(productId);

  @override
  Future<void> addProduct(Product product) => _productDao.insertProduct(product);

  @override
  Future<bool> updateProduct(Product product ) => _productDao.updateProductData(product);

  @override
  Future<int> deleteProduct(String id) => _productDao.deleteProduct(id);
}
