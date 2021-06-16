import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopex/core/ServiceController/product_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    newGetProduct();
  }

  newGetProduct() async {
    var provider = Provider.of<FeatchProduct>(context, listen: false);
    if (provider.product.isNotEmpty) {
      provider.product.clear();
    }
    await provider.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FeatchProduct>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            state.loadStatus == ProductLoadStatus.searching
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state.loadStatus == ProductLoadStatus.empty
                    ? 'This'.text.make()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.product.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: state.product[index].title!.text.make(),
                            subtitle:
                                state.product[index].description!.text.make(),
                            leading: Image.network(state.product[index].image!),
                          );
                        },
                      )
          ],
        ),
      ),
    );
  }
}
