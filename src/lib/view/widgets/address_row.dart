import 'package:flutter/material.dart';

import '../../model/endereco.dart';
import '../../utils/colors.dart';
import '../../utils/theme_helper.dart';

class AddressRow extends StatelessWidget {
  final Endereco address;

  const AddressRow({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Row(
                      children: _buildAddressFields(constraints),
                    ),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAddressFields(BoxConstraints constraints) {
    List<String> fields = [
      address.cep,
      address.logradouro,
      address.complemento,
      address.bairro,
      address.localidade,
      address.uf,
      address.ibge,
    ];

    int numVisibleFields = constraints.maxWidth > 600 ? 7 : 4;

    return fields.sublist(0, numVisibleFields).map((field) {
      return Expanded(
        child: Text(
          field,
          style: ThemeHelper().textStyleStandard(),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList()
      ..add(
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.menu, color: cinzaEscuro),
              onPressed: () {},
            ),
          )
      );
  }
}
