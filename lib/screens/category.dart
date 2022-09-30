import 'package:esppr/utilities/categ_list.dart';
import 'package:esppr/widgets/fake_search.dart';
import 'package:flutter/material.dart';

List<ItemsData> items = [
  ItemsData(label: 'Mens'),
  ItemsData(label: 'Women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'Bags'),
  ItemsData(label: 'Electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'kids'),
  ItemsData(label: 'Beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    for (var elements in items) {
      elements.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch()),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sidenavbar(size)),
          Positioned(bottom: 0, right: 0, child: cateView(size))
        ],
      ),
    );
  }

  Widget sidenavbar(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.bounceInOut);
              },
              child: Container(
                color: items[index].isSelected == true
                    ? Colors.white
                    : Colors.grey.shade300,
                height: 100,
                child: Center(child: Text(items[index].label)),
              ),
            );
          }),
    );
  }

  Widget cateView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var elements in items) {
            elements.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          Center(child: Text('Mens Category')),
          Center(child: Text('Womens Category')),
          Center(child: Text('shoes Category')),
          Center(child: Text('Bags Category')),
          Center(child: Text('electronics Category')),
          Center(child: Text('home and garden Category')),
          Center(child: Text('Kids Category')),
          Center(child: Text('Beauty Category'))
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}
