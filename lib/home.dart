import 'package:flutter/material.dart';
import 'package:simpleapi/Models/product_model.dart';

import 'package:simpleapi/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductModel? _productModel;

  @override
  void initState() {
    super.initState();
    _postData();
  }

  // void _getData() async {
  //   _userModel = (await ApiService().getUsers())!;
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  // }

  void _postData() async {
    _productModel = await ApiService().post();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('REST API Example'),
        ),
        body: _productModel?.result == null || _productModel!.result!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(0),
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.2),
                    childAspectRatio: 6 / 5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2),
                // currentwidth < 600
                //     ? 2
                //     : currentwidth > 600 && currentwidth <= 992
                //         ? 3
                //         :

                //          4),
                itemCount: _productModel?.result?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 0, right: 0),
                    child: SizedBox(
                      width: 300.0,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                height: 200.0,
                                width: 300.0,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Image.network(
                                    _productModel!.result![index].productImg1
                                        .toString(),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            width: 300.0,
                            color: const Color(0xff6f2548),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'View Details',
                              ),
                            ),
                          ),
                          Container(
                            width: 300.0,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 10.0, top: 10.0),
                                  child: Text(
                                    _productModel!.result![index].productName
                                        .toString(),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                      '\u{20B9}${_productModel?.result![index].originalPrice.toString()}'),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 10.0),
                                //   child: Text(gscreen[index].gPrice,
                                //       style:currentwidth<600 ? about12 :about15),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
