import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product_provider.dart';
import 'package:pharmacy_application/screens/manage/edit_product_screen.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatelessWidget {
  final String id, title, image;
  SingleItem({this.id, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return Container(
      width: double.infinity,
      height: 100,
      child: Center(
        child: ListTile(
          title: Text(
            //title
            this.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          leading: Container(
            height: 150,
            width: 75,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue[900]),
              //borderRadius: BorderRadius.circular(30),
            ),
            child: Image.network(this.image),
          ),
          trailing: Container(
            width: 100,
            height: 200,
            child: Row(
              children: <Widget>[
                Tooltip(
                  message: 'Edit medicine',
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          EditProductScreen.routeName,
                          arguments: this.id);
                    },
                  ),
                ),
                Tooltip(
                  message: 'Delete medicine',
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      try {
                        await Provider.of<ProductProvider>(context,
                                listen: false)
                            .deleteProduct(this.id);
                      } catch (error) {
                        scaffold.showSnackBar(SnackBar(
                            content: Text(
                          'Deleting fail',
                          textAlign: TextAlign.center,
                        )));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
