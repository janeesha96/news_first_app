import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailView.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<int> items = [
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    8,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DetailView()));
            },
            child: SizedBox(
              height: 130,
              width: width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.amber,
              ),
            ),
          );
        });
  }
}
