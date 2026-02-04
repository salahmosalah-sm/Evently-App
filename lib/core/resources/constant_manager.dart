import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/data/data_model/category_data_model.dart';

class ConstantManager {
  ConstantManager._();

  static String weakPassword = "weak-password";
  static String emailAlreadyInUse = "email-already-in-use";
  static String invalidCredential = "invalid-credential";

  static List<CategoryDM> categories = [
    CategoryDM(
      id: 0,
      categoryName: "All",
      imagePath: ImagesManager.sportBlack,
      iconPath: IconsManager.all,
    ),
    CategoryDM(
      id: 1,
      categoryName: "Sport",
      imagePath: ImagesManager.sportBlack,
      iconPath: IconsManager.sport,
    ),
    CategoryDM(
      id: 2,
      categoryName: "Birthday",
      imagePath: ImagesManager.birthdayBlack,
      iconPath: IconsManager.birthday,
    ),
    CategoryDM(
      id: 3,
      categoryName: "Meeting",
      imagePath: ImagesManager.meetingBlack,
      iconPath: IconsManager.meeting,
    ),
    CategoryDM(
      id: 4,
      categoryName: "Gaming",
      imagePath: ImagesManager.gamingBlack,
      iconPath: IconsManager.gaming,
    ),
    CategoryDM(
      id: 5,
      categoryName: "Eating",
      imagePath: ImagesManager.eatingBlack,
      iconPath: IconsManager.eating,
    ),
    CategoryDM(
      id: 6,
      categoryName: "Holiday",
      imagePath: ImagesManager.holidayBlack,
      iconPath: IconsManager.holiday,
    ),
    CategoryDM(
      id: 7,
      categoryName: "Exhibition",
      imagePath: ImagesManager.exhibitionBlack,
      iconPath: IconsManager.exhibition,
    ),
    CategoryDM(
      id: 8,
      categoryName: "WorkShop",
      imagePath: ImagesManager.workShopBlack,
      iconPath: IconsManager.workShop,
    ),
    CategoryDM(
      id: 9,
      categoryName: "BookClub",
      imagePath: ImagesManager.bookClubBlack,
      iconPath: IconsManager.bookClub,
    ),
  ];
  static List<CategoryDM> categoriesWithoutAll = [
    CategoryDM(
      id: 1,
      categoryName: "Sport",
      imagePath: ImagesManager.sportBlack,
      iconPath: IconsManager.sport,
    ),
    CategoryDM(
      id: 2,
      categoryName: "Birthday",
      imagePath: ImagesManager.birthdayBlack,
      iconPath: IconsManager.birthday,
    ),
    CategoryDM(
      id: 3,
      categoryName: "Meeting",
      imagePath: ImagesManager.meetingBlack,
      iconPath: IconsManager.meeting,
    ),
    CategoryDM(
      id: 4,
      categoryName: "Gaming",
      imagePath: ImagesManager.gamingBlack,
      iconPath: IconsManager.gaming,
    ),
    CategoryDM(
      id: 5,
      categoryName: "Eating",
      imagePath: ImagesManager.eatingBlack,
      iconPath: IconsManager.eating,
    ),
    CategoryDM(
      id: 6,
      categoryName: "Holiday",
      imagePath: ImagesManager.holidayBlack,
      iconPath: IconsManager.holiday,
    ),
    CategoryDM(
      id: 7,
      categoryName: "Exhibition",
      imagePath: ImagesManager.exhibitionBlack,
      iconPath: IconsManager.exhibition,
    ),
    CategoryDM(
      id: 8,
      categoryName: "WorkShop",
      imagePath: ImagesManager.workShopBlack,
      iconPath: IconsManager.workShop,
    ),
    CategoryDM(
      id: 9,
      categoryName: "BookClub",
      imagePath: ImagesManager.bookClubBlack,
      iconPath: IconsManager.bookClub,
    ),
  ];
}
