import 'package:expense_tracker/app/controllers/home_controller.dart';
import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/pages/record_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Obx(
            () => Column(
              children: [
                Text(
                  "Account Balance",
                  style: GoogleFonts.inter(
                    color: Color(0xff918fa2),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${controller.balance.value < 0 ? "-" : ""}\$${controller.balance.value.abs()}",
                  style: GoogleFonts.montserrat(
                    color: controller.balance.value >= 0
                        ? Color(0xff08a473)
                        : Color(0xfff73d54),
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) {
                              return RecordPage(
                                isIncome: true,
                                categories: controller.incomeCategories,
                              );
                            }),
                          );
                          controller.loadAll();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff08a473),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f2fc),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/income.png",
                                  height: 30,
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Income",
                                    style: GoogleFonts.inter(
                                      color: Color(0xfff6f3fc),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "\$${controller.income.value}",
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xfff6f3fc),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) {
                              return RecordPage(
                                isIncome: false,
                                categories: controller.expenseCategories,
                              );
                            }),
                          );
                          controller.loadAll();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xfff73d54),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xfff5f2fc),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/expense.png",
                                  height: 30,
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Expenses",
                                    style: GoogleFonts.inter(
                                      color: Color(0xfff6f3fc),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "\$${controller.expense.value}",
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xfff6f3fc),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: controller.expenses.value.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset("assets/no-record.png"),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.expenses.value.length,
                          itemBuilder: (_, int index) {
                            ExpenseEntity record =
                                controller.expenses.value[index];
                            return CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) {
                                    return RecordPage(
                                      isIncome: record.isIncome,
                                      categories: record.isIncome
                                          ? controller.incomeCategories
                                          : controller.expenseCategories,
                                      // expense: record,
                                    );
                                  }),
                                );
                                controller.loadAll();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffF8F8F8),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: record.isIncome
                                            ? Color(0xffCFFAEA)
                                            : Color(0xffefc9cb),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        record.isIncome
                                            ? "assets/income.png"
                                            : "assets/expense.png",
                                        height: 35,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            record.category,
                                            style: GoogleFonts.inter(
                                              color: Color(0xff292B2D),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            record.description,
                                            style: GoogleFonts.inter(
                                              color: Color(0xff91919F),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${record.isIncome ? "+" : "-"} \$${record.amount}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: record.isIncome
                                                ? Color(0xff08a473)
                                                : Color(0xffFD3C4A),
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          DateFormat.Hm().format(record.time),
                                          style: GoogleFonts.nunito(
                                            color: Color(0xff91919F),
                                            height: 1.1,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          DateFormat.MMMMd()
                                              .format(record.time),
                                          style: GoogleFonts.nunito(
                                            color: Color(0xff91919F),
                                            height: 1,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
