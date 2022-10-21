import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubit/shop_app_cubit.dart';
import 'package:shop_app/data/models/home/home_model.dart';
import 'package:shop_app/style/theme.dart';
import '../../../data/models/categories/categories_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeModel homeModel;
        CategoriesModel categoriesModel;
        return ConditionalBuilder(
            condition: ShopAppCubit.get(context).homeModel != null &&
                ShopAppCubit.get(context).categoriesModel != null,
            builder: (context) => widgetBuilder(
                ShopAppCubit.get(context).homeModel!,
                ShopAppCubit.get(context).categoriesModel!),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }

  Widget widgetBuilder(HomeModel homeModel, CategoriesModel categoriesModel) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => itemCategories(
                          categoriesModel.data.categoriesData[index]),
                      separatorBuilder: (context, index) => SizedBox(width: 7),
                      itemCount: categoriesModel.data.categoriesData.length),
                ),
                SizedBox(height: 8),
                Text(
                  "New Products",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                ),
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
                    children: List.generate(
                        homeModel.data.products.length,
                        (index) =>
                            widgetProducts(homeModel.data.products[index])),
                  ),
                )
              ],
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
                      SizedBox(
                        width: 10,
                      ),
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
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border)),
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

  Widget itemCategories(DataModel categoriesModel) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
                fit: BoxFit.cover, imageUrl: categoriesModel.image),
            Container(
                width: 100,
                color: Colors.black.withOpacity(0.8),
                child: Text(categoriesModel.name,
                    style: TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                    textAlign: TextAlign.center))
          ],
        ),
      ),
    );
  }
}
