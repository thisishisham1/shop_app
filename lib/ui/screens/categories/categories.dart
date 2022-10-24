import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubit/shop_app_cubit.dart';
import 'package:shop_app/data/models/categories/categories_model.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppState>(
        builder: (context, state) {
          return ConditionalBuilder(
              condition: ShopAppCubit.get(context).categoriesModel != null,
              builder: (context)=>ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(thickness: 2),
                  itemCount: ShopAppCubit.get(context)
                      .categoriesModel!
                      .data
                      .categoriesData
                      .length,
                  itemBuilder: (context, index) => builderList(context,
                      ShopAppCubit.get(context)
                          .categoriesModel!
                          .data
                          .categoriesData[index])),
              fallback:(context)=> Center(
                child: CircularProgressIndicator(),
              ));
        },
        listener: (context, state) {});
  }

  Widget builderList(context, DataModel model) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: model.image,
              width: 150,
            ),
          ),
          Expanded(
            child: Text(
              model.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    );
  }
}
