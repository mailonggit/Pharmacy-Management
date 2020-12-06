class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;

  Product({this.id, this.title, this.description, this.price, this.image});
}

List<Product> products = [
  Product(
    id: '1',
    title: 'Betadine Antiseptic Sol',
    description: dummyDescription,
    price: 10.4,
    image:
        'assets/images/medicine-1.png',
  ),
  Product(
    id: '2',
    title: 'Farzincol 10mg',
    description: dummyDescription,
    price: 5.3,
    image:
        'assets/images/medicine-2.png',
  ),
  Product(
    id: '3',
    title: 'Kin_Gingivon',
    description: dummyDescription,
    price: 2.1,
    image:
        'assets/images/medicine-3.png',
  ),
  Product(
    id: '4',
    title: 'Magne B6 Corbiere',
    description: dummyDescription,
    price: 12.4,
    image:
        'assets/images/medicine-4.png',
  ),
  Product(
    id: '5',
    title: 'Paracetamol_Choay',
    description: dummyDescription,
    price: 9.8,
    image:
        'assets/images/medicine-5.png',
  ),
];

String dummyDescription =
    'Medicine is the science and practice of establishing the diagnosis, prognosis, treatment, and prevention of disease. Medicine encompasses a variety of health care practices evolved to maintain and restore health by the prevention and treatment of illness.';
