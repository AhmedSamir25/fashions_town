import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/features/home/data/model/category_model.dart';

class  CategoryItemData{

  static List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "mobiles",
      image: AssetsManager.mobiles,
      name: "mobiles",
    ),
    CategoryModel(
      id: "pc",
      image: AssetsManager.pc,
      name: "pc",
    ),
    CategoryModel(
      id: "Electronics",
      image: AssetsManager.electronics,
      name: "Electronics",
    ),
    CategoryModel(
      id: "videoGame",
      image: AssetsManager.videoGame,
      name: "videoGame",
    ),
    CategoryModel(
      id: "Watches",
      image: AssetsManager.watch,
      name: "Watches",
    ), 
    CategoryModel(
      id: "Clothes",
      image: AssetsManager.clothes,
      name: "Clothes",
    ),
    CategoryModel(
      id: "Shoes",
      image: AssetsManager.shoes,
      name: "Shoes",
    ),
    CategoryModel(
      id: "perfumes",
      image: AssetsManager.perfumes,
      name: "perfumes",
    ),
  ];
}
