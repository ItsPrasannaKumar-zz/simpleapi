// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.result,
    });

    List<Result>? result;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.productId,
        this.productName,
        this.productImg1,
        this.originalPrice,
        this.discountRate,
        this.offerPrice,
    });

    String? productId;
    String ?productName;
    String ?productImg1;
    String ?originalPrice;
    String ?discountRate;
    String ?offerPrice;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        productId: json["product_id"],
        productName: json["product_name"],
        productImg1: json["product_img1"],
        originalPrice: json["original_price"],
        discountRate: json["discount_rate"],
        offerPrice: json["offer_price"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_img1": productImg1,
        "original_price": originalPrice,
        "discount_rate": discountRate,
        "offer_price": offerPrice,
    };
}
