import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../bloc/bloc/checkout_bloc.dart';
import '../dialogs/discount_dialog.dart';
import '../dialogs/service_dialog.dart';
import '../dialogs/success_payment_dialog.dart';
import '../dialogs/tax_dialog.dart';
import '../models/product_category.dart';
import '../models/product_model.dart';
import '../widgets/column_button.dart';
import '../widgets/order_menu.dart';

class ConfirmPaymentPage extends StatefulWidget {
  const ConfirmPaymentPage({super.key});

  @override
  State<ConfirmPaymentPage> createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  final totalPriceController = TextEditingController();
  final products = [
    ProductModel(
        image: Assets.images.product1.path,
        name: 'Vanila Late Vanila itu',
        category: ProductCategory.drink,
        price: 200000,
        stock: 10),
    ProductModel(
        image: Assets.images.product2.path,
        name: 'V60',
        category: ProductCategory.drink,
        price: 1200000,
        stock: 10),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Hero(
        tag: 'confirmation_screen',
        child: Scaffold(
          body: Row(
            children: [
              // LEFT CONTENT
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Konfirmasi',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Orders #1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                height: 60.0,
                                width: 60.0,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(8.0),
                        const Divider(),
                        const SpaceHeight(24.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Item',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                            ),
                            SizedBox(
                              width: 50.0,
                              child: Text(
                                'Qty',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Price',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(8),
                        const Divider(),
                        const SpaceHeight(8),
                        BlocBuilder<CheckoutBloc, CheckoutState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const Center(
                                child: Text('No Items'),
                              ),
                              success: (products, qty, price) {
                                if (products.isEmpty) {
                                  return const Center(
                                    child: Text('No Items'),
                                  );
                                }
                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      OrderMenu(data: products[index]),
                                  separatorBuilder: (context, index) =>
                                      const SpaceHeight(16.0),
                                  itemCount: products.length,
                                );
                              },
                            );
                          },
                        ),
                        const SpaceHeight(16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ColumnButton(
                              label: 'Diskon',
                              svgGenImage: Assets.icons.diskon,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => const DiscountDialog(),
                              ),
                            ),
                            ColumnButton(
                              label: 'Pajak',
                              svgGenImage: Assets.icons.pajak,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => const TaxDialog(),
                              ),
                            ),
                            ColumnButton(
                              label: 'Layanan',
                              svgGenImage: Assets.icons.layanan,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => const ServiceDialog(),
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(8.0),
                        const Divider(),
                        const SpaceHeight(8.0),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pajak',
                              style: TextStyle(color: AppColors.grey),
                            ),
                            Text(
                              '11 %',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Diskon',
                              style: TextStyle(color: AppColors.grey),
                            ),
                            Text(
                              'Rp. 0',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sub total',
                              style: TextStyle(color: AppColors.grey),
                            ),
                            BlocBuilder<CheckoutBloc, CheckoutState>(
                              builder: (context, state) {
                                final price = state.maybeWhen(
                                  orElse: () => 0,
                                  success: (products, qty, price) => price,
                                );
                                return Text(
                                  price.currencyFormatRp,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            BlocBuilder<CheckoutBloc, CheckoutState>(
                              builder: (context, state) {
                                final price = state.maybeWhen(
                                  orElse: () => 0,
                                  success: (products, qty, price) => price,
                                );
                                final tax = price * 0.11;
                                final total = price + tax;
                                totalPriceController.text =
                                    total.ceil().toString();
                                return Text(
                                  total.ceil().currencyFormatRp,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        // const SpaceHeight(20.0),
                        // Button.filled(
                        //   onPressed: () {},
                        //   label: 'Lanjutkan Pembayaran',
                        // ),
                      ],
                    ),
                  ),
                ),
              ),

              // RIGHT CONTENT
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pembayaran',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              '1 opsi pembayaran tersedia',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SpaceHeight(8.0),
                            const Divider(),
                            const SpaceHeight(8.0),
                            const Text(
                              'Metode Bayar',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SpaceHeight(12.0),
                            Row(
                              children: [
                                Button.filled(
                                  width: 120.0,
                                  height: 50.0,
                                  onPressed: () {},
                                  label: 'Cash',
                                ),
                                const SpaceWidth(8.0),
                                Button.outlined(
                                  width: 120.0,
                                  height: 50.0,
                                  onPressed: () {},
                                  label: 'QRIS',
                                  disabled: true,
                                ),
                              ],
                            ),
                            const SpaceHeight(8.0),
                            const Divider(),
                            const SpaceHeight(8.0),
                            const Text(
                              'Total Bayar',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SpaceHeight(12.0),
                            TextFormField(
                              controller: totalPriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintText: 'Total harga',
                              ),
                            ),
                            const SpaceHeight(45.0),
                            Row(
                              children: [
                                Button.filled(
                                  width: 150.0,
                                  onPressed: () {},
                                  label: 'UANG PAS',
                                ),
                                const SpaceWidth(20.0),
                                Button.filled(
                                  width: 150.0,
                                  onPressed: () {},
                                  label: 'Rp 250.000',
                                ),
                                const SpaceWidth(20.0),
                                Button.filled(
                                  width: 150.0,
                                  onPressed: () {},
                                  label: 'Rp 300.000',
                                ),
                              ],
                            ),
                            const SpaceHeight(100.0),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ColoredBox(
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 16.0),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Button.outlined(
                                    onPressed: () => context.pop(),
                                    label: 'Batalkan',
                                  ),
                                ),
                                const SpaceWidth(8.0),
                                Flexible(
                                  child: Button.filled(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) =>
                                            const SuccessPaymentDialog(),
                                      );
                                    },
                                    label: 'Bayar',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
