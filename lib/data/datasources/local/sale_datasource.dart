import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/sale_dao.dart';
import 'package:pos_meat_shop/data/database/sale_line_item_dao.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';
import 'package:pos_meat_shop/domain/models/sale_line_item.dart';
import 'package:rxdart/rxdart.dart';

class SaleLocalDataSource {
  final SaleDao _saleDao;
  final SaleLineItemDao _saleLineItemDao;

  SaleLocalDataSource(this._saleDao, this._saleLineItemDao);

  Future<List<Sale>> getAllSales() async {
    var sales = await _saleDao.getAllSales();

    for (final sale in sales) {
      sale.lineItems = await _saleLineItemDao
          .getSaleLineItemBySaleId(sale.id);
    }
    return sales;
  }

  Future<Sale?> getSaleById(String saleId) =>
      _saleDao.getSaleById(saleId);

  Future<bool> updateSale(SalesCompanion sale) =>
      _saleDao.updateSaleData(sale);

  Future<int> addSale(Sale sale) async {
    var saleId = await _saleDao.insertSale(sale.toCompanion(true));
    if (sale.lineItems.isEmpty) return saleId;

    for (final item in sale.lineItems.where((item) => item.quantity > 0)) {
      await _saleLineItemDao.insertSaleLineItem(item.toCompanion(true));
    }
    return saleId;
  }

  Stream<List<Sale>> watchAllSales() {
    final salesStream = _saleDao.watchAllSales();
    final lineItemsStream = _saleLineItemDao.watchAllSaleLineItems();

  // Combine the two streams so that whenever either emits new data,
  // we recalculate a joined List<SaleWithItems>
  return Rx.combineLatest2<List<Sale>, List<SaleLineItem>, List<Sale>>(
    salesStream,
    lineItemsStream,
    (sales, lineItems) {
      // group lineItems by saleId
      final itemsBySaleId = <String, List<SaleLineItem>>{};

      for (final item in lineItems) {
        itemsBySaleId.putIfAbsent(item.saleId, () => []).add(item);
      }

      // create a new List<SaleWithItems>
      final saleWithItemsList = sales.map((sale) {
        final items = itemsBySaleId[sale.id] ?? <SaleLineItem>[];

        return sale.copyWith(lineItems: items);
        
      }).toList();

      return saleWithItemsList;
    });
  }

  Future<int> deleteSale(String id) => _saleDao.deleteSale(id);
}
