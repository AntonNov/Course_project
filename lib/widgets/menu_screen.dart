import 'package:flutter/material.dart';

Widget makeCategoryWidget({required String path}) {
  return Image.network(
    path,
    height: 250,
    fit: BoxFit.cover,
  );
}

List<Widget> makeCategoriesWidget() {
  return [
    makeCategoryWidget(
        path:
            'https://media.istockphoto.com/id/1377372234/es/foto/pizza-con-salami-pimiento-tomates-y-queso-encurtidos-tocino-y-salchichas-sobre-un-fondo-ligero.jpg?s=612x612&w=0&k=20&c=mEKMbrhjixwgGcdrq7Jm-E5wyhBfinRbGbCc8__y4Fs='),
    makeCategoryWidget(
        path:
            "https://media.istockphoto.com/id/1407982559/es/foto/espaguetis-o-linguine-con-carne-y-salsa-de-tomate-bolo%C3%B1esa-sobre-un-plato-negro-y-fondo-oscuro.jpg?s=612x612&w=0&k=20&c=vafB1q9tM0IfRzToK0Qkd-56IY4D5ts8xCemP1EZdLY="),
    makeCategoryWidget(
        path:
            'https://media.istockphoto.com/id/1343569460/es/foto/un-taz%C3%B3n-blanco-de-ensalada-c%C3%A9sar-fotograf%C3%ADa.jpg?s=612x612&w=0&k=20&c=dW3ZRiJKx6R6Uu5Cn4OubAc6cVyScVB_ZSjqmXN1jfE='),
    makeCategoryWidget(
        path:
            'https://media.istockphoto.com/id/1447673516/es/foto/pud%C3%ADn-de-caramelo-en-crema-con-salsa-de-caramelo-en-el-plato.jpg?s=612x612&w=0&k=20&c=LYhER_lGMKpr1p7UcSOY2EQHQDVKIGmErcLvNZYhBTk='),
    makeCategoryWidget(
        path:
            'https://media.istockphoto.com/id/1368679348/es/foto/gafas-de-refresco.jpg?s=612x612&w=0&k=20&c=6TVyvO3a0Uj-RzTj4QryP4IGE0SdVQpyiLDzDxFdMuk=')
  ];
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: makeCategoriesWidget(),
      ),
    );
  }
}
