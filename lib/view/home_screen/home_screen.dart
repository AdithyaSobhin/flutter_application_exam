import 'package:flutter/material.dart';
import 'package:flutter_application_exam/controller/home_screen_controller.dart';
import 'package:flutter_application_exam/main.dart';
import 'package:flutter_application_exam/view/product_details_screen/product_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getAllProducts();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = context.watch<HomeScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(.2)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.search,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Search anything",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: homeScreenProvider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: ListView.separated(
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      homeScreenProvider
                                          .listofProducts[index].name
                                          .toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                          itemCount: homeScreenProvider.listofProducts.length)))
        ],
      ),
    );
  }
}
