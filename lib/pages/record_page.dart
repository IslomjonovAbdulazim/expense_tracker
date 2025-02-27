import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expense_tracker/app/controllers/home_controller.dart';
import 'package:expense_tracker/app/controllers/record_controller.dart';
import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RecordController>();
    return Obx(
      () => Scaffold(
        backgroundColor:
            controller.expense.value.type == ExpenseEnum.income ? Color(0xff00a86b) : Color(0xffFD3C4A),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor:
          controller.expense.value.type == ExpenseEnum.income ? Color(0xff00a86b) : Color(0xffFD3C4A),
          leadingWidth: 80,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/arrow-left.png",
            ),
          ),
          title: Text(
            controller.expense.value.type == ExpenseEnum.income ? "Income" : "Expense",
            style: GoogleFonts.inter(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          actions: [
            // widget.expense == null
            //     ? SizedBox.shrink()
            //     : IconButton(
            //         onPressed: () async {
            //           // await deleteExpense(widget.expense!);
            //           Navigator.pop(context);
            //         },
            //         icon: Icon(
            //           CupertinoIcons.delete,
            //           color: Color(0xffFFFFFF),
            //         ),
            //       ),
            SizedBox(width: 5),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "How much?",
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFCFCFC).withValues(alpha: .8),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$",
                          style: GoogleFonts.inter(
                            color: Color(0xffFCFCFC),
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 70,
                            child: TextField(
                              controller: controller.numberController.value,
                              focusNode: controller.numberFocus.value,
                              onTapOutside: (_) {
                                controller.unFocus();
                              },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              cursorColor: Color(0xffFCFCFC),
                              maxLines: 1,
                              maxLength: 8,
                              cursorHeight: 60,
                              style: GoogleFonts.montserrat(
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFCFCFC),
                              ),
                              autocorrect: false,
                              autofocus: true,
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                counter: SizedBox.shrink(),
                                hintText: "0",
                                hintStyle: GoogleFonts.montserrat(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFCFCFC),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropdownButton2(
                        barrierColor: Colors.black.withValues(alpha: .5),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: Color(0xffF1F1FA),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        underline: SizedBox.shrink(),
                        isExpanded: true,
                        value: controller.selectedCategory?.value,
                        onChanged: controller.selectCategory,
                        style: GoogleFonts.nunito(
                          color: Color(0xff2a2b2d),
                          fontSize: 18,
                        ),
                        hint: Text(
                          "Category",
                          style: GoogleFonts.inter(
                            color: Color(0xff91919F),
                          ),
                        ),
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF1F1FA)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Image.asset(
                            "assets/arrow-down.png",
                            height: 30,
                          ),
                        ),
                        items: incomeCategories.map<DropdownMenuItem<String>>(
                          (str) {
                            return DropdownMenuItem(
                              value: str,
                              child: Text(
                                str,
                                style: GoogleFonts.nunito(
                                  color: Color(0xff2a2b2d),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: controller.descriptionController.value,
                        focusNode: controller.descriptionFocus.value,
                        maxLength: 200,
                        maxLines: 4,
                        autocorrect: false,
                        textInputAction: TextInputAction.done,
                        onTapOutside: (_) {
                          controller.unFocus();
                        },
                        cursorColor: Color(0xff2a2b2d),
                        style: GoogleFonts.nunito(
                          color: Color(0xff2a2b2d),
                          height: 1.14,
                          fontWeight: FontWeight.w500,
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          counter: SizedBox.shrink(),
                          hintText: "Description",
                          hintStyle: GoogleFonts.inter(
                            color: Color(0xff91919F),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xffF1F1FA),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xffF1F1FA),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff7F3DFF),
                          fixedSize: Size.fromHeight(55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          int? amount =
                              int.tryParse(controller.numberController.value.text.trim());
                          String description =
                              controller.descriptionController.value.text.trim();
                          if (amount != null && controller.selectedCategory != null) {
                            // DateTime? oldTime = widget.expense?.time;
                            // ExpenseEntity expense = ExpenseEntity(
                            //   category: selectedCategory!,
                            //   isIncome: widget.isIncome,
                            //   amount: amount,
                            //   description: description,
                            //   time: oldTime ?? DateTime.now(),
                            //   id: -1,
                            // );
                            // await addNewExpense(expense);
                            Navigator.pop(context);
                          }
                        },
                        child: Center(
                          child: Text(
                            "Save",
                            style: GoogleFonts.inter(
                              color: Color(0xffFCFCFC),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
