import 'package:get/get.dart';

class StatusCodeService {
  static void showSnackbar(int statusCode) {
    String title = "Xatolik";
    String message = "Nimadir noto‘g‘ri ketdi.";
    bool isError = true;

    switch (statusCode) {
      case 200:
        title = "Muvaffaqiyatli";
        message = "So‘rov muvaffaqiyatli bajarildi.";
        isError = false;
        break;
      case 201:
        title = "Yaratildi";
        message = "Yangi resurs muvaffaqiyatli yaratildi.";
        isError = false;
        break;
      case 400:
        title = "Noto‘g‘ri so‘rov";
        message = "So‘rov noto‘g‘ri. Iltimos, ma’lumotlarni tekshiring.";
        break;
      case 401:
        title = "Avtorizatsiya talab qilinadi";
        message = "Birinchi bo‘lib tizimga kiring.";
        break;
      case 403:
        title = "Ruxsat yo‘q";
        message = "Bu resursga kirish huquqiga ega emassiz.";
        break;
      case 404:
        title = "Topilmadi";
        message = "So‘ralgan resurs topilmadi.";
        break;
      case 405:
        title = "Ruxsat etilmagan metod";
        message = "Bu so‘rov metodi qo‘llab-quvvatlanmaydi.";
        break;
      case 408:
        title = "So‘rov vaqti tugadi";
        message = "Server javob berish uchun juda uzoq kutdi.";
        break;
      case 409:
        title = "To‘qnashuv";
        message = "Resurs holati bilan bog‘liq to‘qnashuv yuzaga keldi.";
        break;
      case 429:
        title = "Ko‘p so‘rov";
        message = "Juda ko‘p so‘rov jo‘natdingiz. Iltimos, biroz kuting.";
        break;
      case 500:
        title = "Ichki server xatosi";
        message = "Serverda nimadir noto‘g‘ri ketdi.";
        break;
      case 502:
        title = "Yomon shlyuz";
        message = "Server noto‘g‘ri javob qaytardi.";
        break;
      case 503:
        title = "Xizmat mavjud emas";
        message = "Server hozircha ishlamayapti.";
        break;
      case 504:
        title = "Shlyuz vaqti tugadi";
        message = "Server o‘z vaqtida javob olmadi.";
        break;
      default:
        title = "Noma’lum xatolik";
        message = "Kutilmagan xatolik yuz berdi. Kod: $statusCode";
        break;
    }

    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          isError ? Get.theme.colorScheme.error : Get.theme.colorScheme.primary,
      colorText: Get.theme.colorScheme.onPrimary,
      duration: Duration(seconds: 3),
    );
  }
}
