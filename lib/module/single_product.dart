import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/controller/cart/cart_cubit/cubit/add_to_cart_cubit.dart';
import 'package:responsive/controller/cart/cart_model/cart_model.dart';
import 'package:responsive/model/product_model/product_model/product.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/theme/color.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCartDataCubit, AddCartDataState>(
      listener: (context, state) {
        if (state is AddCartDataLoading) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: SharedColor.greenColor,
                  ))),
            ),
          );
        } else if (state is AddCartDataSuccess) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                width: 100.w,
                height: 100.h,
                child: const Center(child: Text("This data us Added")),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            title: Text(
              'تفاصيل المنتج',
              style: TextStyle(
                color: const Color.fromARGB(255, 146, 146, 164),
                fontSize: 25.sp,
              ),
            ),
            leading: Icon(
              Icons.arrow_back,
              color: SharedColor.blackColor,
              size: 25.sp,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://marketappmaster.com/api/${widget.product.img.toString()}"),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  customText(
                    text: widget.product.name ?? "",
                    color: SharedColor.blackColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  SizedBox(
                    width: double.infinity,
                    child: customText(
                      text: widget.product.details ?? "",
                      color: const Color.fromARGB(255, 112, 106, 106),
                      fontSize: 25.sp,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Row(
                    children: [
                      customText(
                        text: "السعر:",
                        color: SharedColor.blackColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      customText(
                        text: widget.product.price.toString(),
                        color: SharedColor.blackColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      /* Container(
                        width: ScreenUtil().setWidth(50),
                        height: ScreenUtil().setHeight(50),
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                      ), */
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) _quantity--;
                          });
                        },
                      ),
                      Text(
                        '$_quantity',
                        style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddCartDataCubit>(context).addNote(
                        CartProductData(
                          name: widget.product.name ?? "",
                          price: double.parse(widget.product.price.toString()),
                          quality: _quantity,
                          productPhoto: widget.product.img,
                          id: widget.product.id,
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: SharedColor.greenColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
