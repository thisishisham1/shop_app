import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubit/shop_app_cubit.dart';
import 'package:shop_app/data/models/home/home_model.dart';
import 'package:shop_app/style/theme.dart';

class Home extends StatelessWidget {
  var homeCubit;
  late Size size;
  @override
  Widget build(BuildContext context) {
    homeCubit = ShopAppCubit.get(context);
    size = MediaQuery.of(context).size;
    return BlocConsumer<ShopAppCubit, ShopAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeModel homeModel;
        return ConditionalBuilder(
            condition: homeCubit.homeModel != null,
            builder: (context) => widgetBuilder(homeCubit.homeModel),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }

  Widget widgetBuilder(HomeModel homeModel) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
              items: homeModel.data.banners
                  .map((e) => CachedNetworkImage(
                        imageUrl: e.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1.0,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  reverse: false,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal)),
          SizedBox(height: 10),
          Container(
            color: Colors.white60,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.5,
              padding: EdgeInsets.symmetric(horizontal: 5),
              children: List.generate(homeModel.data.products.length,
                  (index) => widgetProducts(homeModel.data.products[index])),
            ),
          )
        ],
      ),
    );
  }

  Widget widgetProducts(ProductsModel productsModel) {
    return InkWell(
      onTap: () {
        print("tab done");
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: productsModel.image,
                  width: double.infinity,
                  height: 200,
                ),
                if (productsModel.discount != 0)
                  Image.asset("assets/image/home/discount1.png",
                      height: 30, width: 30)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productsModel.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black87,
                      height: 1.3,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '${productsModel.price} LE',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: mainColor,
                          height: 1.4,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 10,),
                      if (productsModel.discount != 0)
                        Text(
                          '${productsModel.oldPrice} LE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: textColor, 
                              height: 1.4,
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      Expanded(
                        child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: (){}, icon: Icon(Icons.favorite_border)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
