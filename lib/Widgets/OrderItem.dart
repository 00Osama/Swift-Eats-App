import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Widgets/MyTextfield.dart';
import 'package:fooddeliveryapp/global_fields.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
    required this.address,
    required this.image,
    required this.name,
    required this.order,
    required this.phoneNumber,
    required this.quantity,
    required this.totalPrice,
    this.securityCode,
    this.orderId,
    required this.driverAction,
    this.email,
    required this.showCode,
    this.btnOkOnPress,
  });

  final String image;
  final String order;
  final int quantity;
  final int totalPrice;
  final String name;
  final String phoneNumber;
  final String address;
  final String? securityCode;
  final String? orderId;
  final String driverAction;
  final String? email;
  final String showCode;
  final void Function()? btnOkOnPress;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                const Text(
                  'Order Details',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 134, 110, 148),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: ClipOval(
                        child: FancyShimmerImage(
                          imageUrl: widget.image,
                          shimmerBaseColor: Colors.grey[300],
                          shimmerHighlightColor: Colors.white,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              'order : ${widget.order}',
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 17,
                                color: Color.fromARGB(255, 24, 11, 11),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 200,
                            child: Text(
                              'quantity : ${widget.quantity}',
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 17,
                                color: Color.fromARGB(255, 24, 11, 11),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 200,
                            child: Text(
                              'total price : ' '${widget.totalPrice}\$',
                              style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 17,
                                color: Color.fromARGB(255, 239, 48, 41),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Customer Info',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 134, 110, 148),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.person_rounded),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.phone_rounded),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.phoneNumber,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        widget.address,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                widget.showCode == 'user'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Security Code',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 134, 110, 148),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.securityCode!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : const SizedBox(),
                widget.driverAction == 'driver'
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Colors.grey[800],
                                      ),
                                    ),
                                    onPressed: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.warning,
                                        animType: AnimType.rightSlide,
                                        showCloseIcon: true,
                                        btnOkText: 'Confirm',
                                        btnOkColor: Colors.grey[800],
                                        btnOkOnPress: widget.btnOkOnPress,
                                        body: Column(
                                          children: [
                                            const Text(
                                              'Enter Security Code',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Ubuntu',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                            MyTextField(
                                              readOnly: false,
                                              controller: code,
                                              hintText: 'Order Security Code',
                                              obscureText: false,
                                              errorText: codeErrorText,
                                              inputType: TextInputType.number,
                                            ),
                                          ],
                                        ),
                                      ).show();
                                    },
                                    child: Text(
                                      'Confirm Order',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
