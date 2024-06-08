import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/endereco_provider.dart';
import '../../utils/colors.dart';
import '../../utils/theme_helper.dart';
import 'address_row.dart';

class ListAddressContainer extends StatefulWidget {
  const ListAddressContainer({super.key});

  @override
  createState() => _ListAddressContainerState();
}

class _ListAddressContainerState extends State<ListAddressContainer> {
  final int _pageSize = 5;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EnderecoProvider>(context);
    final addresses = provider.enderecos;

    final start = _currentPage * _pageSize;
    final end = (start + _pageSize).clamp(0, addresses.length);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: ThemeHelper().containerDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeaderRow(),
          if (addresses.isEmpty)
            _buildEmptyState()
          else
            _buildAddressList(addresses.sublist(start, end)),
          _buildPaginationRow(end),
        ],
      ),
    );
  }


  Widget _buildHeaderRow() => Row(
    children: [
      for (final title in ['CEP', 'Lagradouro', 'Complemento', 'Bairro', 'Localidade', 'UF', 'IBGE', 'Opções'])
        Expanded(
          child: Text(title,
            style: ThemeHelper().textStyleBlackBold(),
            textAlign: TextAlign.center,
          ),
        ),
    ],
  );

  Widget _buildEmptyState() => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      SizedBox(height: 20),
      Icon(Icons.warning, size: 48, color: cinzaClaro),
      SizedBox(height: 10),
      Text('Nenhum endereço encontrado', style: TextStyle(fontSize: 16)),
    ],
  );

  Widget _buildAddressList(List addresses) => ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: addresses.length,
    itemBuilder: (context, index) => AddressRow(address: addresses[index]),
  );

  Widget _buildPaginationRow(int end) {
    final provider = Provider.of<EnderecoProvider>(context);
    final start = _currentPage * _pageSize;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${start + 1}-$end de ${provider.enderecos.length}'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: _currentPage > 0 ? () => setState(() => _currentPage--) : null,
              icon: const Icon(Icons.arrow_back_ios, size: 20, color: cinzaClaro),
            ),
            IconButton(
              onPressed: end < provider.enderecos.length ? () => setState(() => _currentPage++) : null,
              icon: const Icon(Icons.arrow_forward_ios, size: 20, color: cinzaClaro),
            ),
          ],
        ),
      ],
    );
  }
}
