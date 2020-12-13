import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/app_drawer.dart';
import 'package:pharmacy_application/components/rounded_button.dart';
import 'package:pharmacy_application/providers/product.dart';
import 'package:pharmacy_application/providers/product_provider.dart';
import 'package:pharmacy_application/screens/manage/manage_product.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    image: '',
  );
  var _initValue = {
    'title': '',
    'description': '',
    'price': '',
    'image': '',
  };
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      //if product available then edit that product by _editedProduct
      if (productId != null) {
        _editedProduct = Provider.of<ProductProvider>(context, listen: false)
            .findById(productId);
        _initValue = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          //'imageUrl': _editedProduct.imageUrl,
        };
        _imageUrlController.text = _editedProduct.image;
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  //avoid memory leak when working with node
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if (_imageUrlController.text.isEmpty) {
        return;
      } else if (!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith('https')) {
        return;
      } else if (!_imageUrlController.text.endsWith('png') &&
          !_imageUrlController.text.endsWith('jpg') &&
          !_imageUrlController.text.endsWith('jpeg')) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate(); //validate user input
    if (!isValid) {
      return;
    }

    _form.currentState.save(); //save form information
    setState(() {
      _isLoading = true; //set to true when user submit form
    });

    if (_editedProduct.id != null) {
      //if product is avalale => update it
      await Provider.of<ProductProvider>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    }
    //add new product
    else {
      try {
        //product is not available on the => create new product by editing
        await Provider.of<ProductProvider>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (error) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An error occurred!'),
                  content: Text('Something went wrong'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(ManageProductScreen.routeName);
                        //Navigator.of(ctx).pop();
                      },
                      child: Text('Okey'),
                    ),
                  ],
                ));
      } finally {}

      setState(() {
        _isLoading = false;
      });
      //only pop once the data is stored
      Navigator.of(context).pushReplacementNamed(ManageProductScreen.routeName); 
    }
    setState(() {
      _isLoading = false;
    });
    //Navigator.of(context).pop(); //only pop once the data is stored
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Add Medicine'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _saveForm,
          ),
        ],
      ),
      drawer: AppDrawer(),
      //if process finish load input form, if not, keep loading
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  key: _form,
                  //use singlechildscrollview and column for long list of input, if we use
                  //listview, it will dynamically remove and re-add widgets when you scroll out of view
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: _initValue['title'],
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(
                                _priceFocusNode); // change to next input when user press enter
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please provide title';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //value = title
                            _editedProduct = Product(
                              title: value,
                              price: _editedProduct.price,
                              description: _editedProduct.description,
                              image: _editedProduct.image,
                              id: _editedProduct.id,
                              isFavorite: _editedProduct.isFavorite,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValue['price'],
                          decoration: InputDecoration(labelText: 'Price'),
                          keyboardType: TextInputType.number, //input by number
                          focusNode: _priceFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(
                                _descriptionFocusNode); // change to next input when user press enter
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please provide price';
                            } else if (double.parse(value) == null) {
                              return 'please enter a valid number';
                            } else if (double.parse(value) <= 0) {
                              return 'please enter number greater than zero';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //value = title
                            _editedProduct = Product(
                              title: _editedProduct.title,
                              price: double.parse(value),
                              description: _editedProduct.description,
                              image: _editedProduct.image,
                              id: _editedProduct.id,
                              isFavorite: _editedProduct.isFavorite,
                            );
                          },
                        ),
                        TextFormField(
                          initialValue: _initValue['description'],
                          decoration: InputDecoration(labelText: 'Description'),
                          maxLines: 3, // number of line
                          keyboardType: TextInputType.multiline,
                          focusNode: _descriptionFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_imageUrlFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please provide description';
                            } else if (value.length < 10) {
                              return 'description should be at least 10 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //value = title
                            _editedProduct = Product(
                              title: _editedProduct.title,
                              price: _editedProduct.price,
                              description: value,
                              image: _editedProduct.image,
                              id: _editedProduct.id,
                              isFavorite: _editedProduct.isFavorite,
                            );
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: _imageUrlController.text.isEmpty
                                    ? Text(
                                        'Enter a Url',
                                        textAlign: TextAlign.center,
                                      )
                                    : FittedBox(
                                        child: Image.network(
                                        _imageUrlController.text,
                                        fit: BoxFit.fitHeight,
                                      )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              //upload image
                              Expanded(
                                //solve unbounded with bug
                                child: TextFormField(
                                  //initialValue: _initValue['imageUrl'],
                                  decoration: InputDecoration(
                                    labelText: 'Image',
                                  ),
                                  keyboardType: TextInputType.url,
                                  textInputAction: TextInputAction.done,
                                  controller: _imageUrlController,
                                  focusNode: _imageUrlFocusNode,
                                  onFieldSubmitted: (value) {
                                    _saveForm();
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'please provide image url';
                                    }
                                    if (!value.startsWith('http') &&
                                        !value.startsWith('https')) {
                                      return 'Please enter a valid url';
                                    }
                                    if (!value.endsWith('png') &&
                                        !value.endsWith('jpg') &&
                                        !value.endsWith('jpeg')) {
                                      return 'Please enter a valid url';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //value = title
                                    _editedProduct = Product(
                                      title: _editedProduct.title,
                                      price: _editedProduct.price,
                                      description: _editedProduct.description,
                                      image: value,
                                      id: _editedProduct.id,
                                      isFavorite: _editedProduct.isFavorite,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        RoundedButton(
                          press: _saveForm,
                          color: Colors.purple[900],
                          text: 'Create New Medicine',
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
