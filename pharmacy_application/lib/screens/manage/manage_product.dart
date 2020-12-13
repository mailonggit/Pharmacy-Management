import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/app_drawer.dart';
import 'package:pharmacy_application/providers/product_provider.dart';
import 'package:pharmacy_application/screens/manage/edit_product_screen.dart';
import 'package:pharmacy_application/screens/manage/user_product_item.dart';
import 'package:provider/provider.dart';

class ManageProductScreen extends StatelessWidget {
  static const routeName = '/manage-product';
  Future<void> _refreshProduct(BuildContext context) async {
    Provider.of<ProductProvider>(context, listen: true).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Medicine List'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProduct(context),
        child: ListView.builder(
            itemCount: productData.products.length,
            itemBuilder: (_, i) => Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserProductItem(
                        id: productData.products[i].id,
                        title: productData.products[i].title,
                        image: productData.products[i].image,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                )),
      ),
    );
  }
}
