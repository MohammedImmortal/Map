class NodeData {
  static final List<String> nodeList = [
    'cairo',
    'alexandria',
    'tanta',
    'benha',
    'hurghada',
    'dahab',
    'damanhur',
    'kafr El Sheikh',
    'kafr El Zayat',
    'mansoura',
    'aswan',
    'asyut',
    'beni Suef',
    'borg El Arab',
    'damietta',
  ];

  static List<String> getSuggestions(String query) =>
      List.of(nodeList).where((node) {
        final nodeLower = node.toLowerCase();
        final queryLower = query.toLowerCase();
        return nodeLower.contains(queryLower);
      }).toList();
}
