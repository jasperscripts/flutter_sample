class House {
  final String name;
  final String category;
  final String picture;
  final String price;
  final String description;

  const House(
      this.name, this.picture, this.price, this.description, this.category);
}

final List<House> houses = _houses
    .map((e) => House(
        e['name'] as String,
        e['picture'] as String,
        e['price'] as String,
        e['description'] as String,
        e['category'] as String))
    .toList(growable: false);

final List<Map<String, Object>> _houses = [
  {
    "price": "\$100,000",
    "picture": "images/house-1.jpg",
    "name": "Virginia Old",
    "category": "Classic Mansion",
    "description":
        "Ut cupidatat sit nisi sit fugiat sunt qui anim aute aliqua incididunt aliqua est duis. Et sit tempor ad qui. Consectetur sint veniam qui fugiat. Laboris pariatur adipisicing cillum cillum reprehenderit veniam dolor. Lorem tempor sint duis excepteur laboris dolor dolor.\r\n",
  },
  {
    "price": "\$30,478.62",
    "picture": "images/house-2.jpg",
    "name": "Virginia Old 2",
    "category": "Classic Mansion",
    "description":
        "Reprehenderit proident enim cillum sint ullamco non laborum eiusmod cupidatat ad fugiat. Officia sint ea Lorem tempor deserunt sunt ex do nulla cillum deserunt. Fugiat consequat non voluptate Lorem sunt sunt elit ipsum eu irure aliquip fugiat reprehenderit.\r\n",
  },
  {
    "price": "\$102,396.10",
    "picture": "images/house-3.jpg",
    "name": "Glasses",
    "category": "Modern House",
    "description":
        "Duis culpa culpa laboris eu commodo anim enim officia tempor reprehenderit reprehenderit duis dolor nisi. Exercitation labore cupidatat consectetur laborum aliquip et consectetur labore. Aute deserunt dolore sint esse in aliqua id dolore eu minim ipsum elit sunt. Cillum magna aute aliquip nostrud ipsum adipisicing. Eu quis consectetur quis proident sint excepteur quis Lorem laborum minim esse elit fugiat.\r\n",
  },
  {
    "price": "\$392,396.10",
    "picture": "images/house-4.jpg",
    "name": "High Garden",
    "category": "Modern House",
    "description":
        "Eu qui ipsum non est deserunt velit eiusmod ad qui ex eiusmod tempor consequat. Eu labore ad laborum voluptate exercitation. Aliquip irure non eu dolor labore laborum tempor. Commodo et id labore nisi adipisicing in magna excepteur ut proident et officia. Quis sit veniam consectetur aliqua ipsum occaecat excepteur culpa.\r\n",
  },
  {
    "price": "\$242,396.10",
    "picture": "images/house-5.jpg",
    "name": "Modern Zen",
    "category": "Minimalist",
    "description":
        "Enim ut laborum duis velit velit duis. Proident excepteur est laborum consequat. Consectetur magna do ex officia excepteur aliquip aliquip reprehenderit consequat pariatur pariatur voluptate et elit. Aliqua exercitation nostrud sunt aliquip excepteur. Do ea officia velit duis aliquip amet. Quis Lorem qui ea minim ullamco culpa anim do sit voluptate fugiat.\r\n",
  },
  {
    "price": "\$102,396.10",
    "picture": "images/house-6.jpg",
    "name": "Leuna De Bay",
    "category": "Apartments",
    "description":
        "Excepteur mollit magna magna officia id consequat. Excepteur velit mollit ex dolor aliquip voluptate irure qui esse minim laborum sunt. Laboris consectetur esse ea Lorem aliqua sunt eu enim fugiat Lorem eiusmod veniam. Anim mollit reprehenderit proident sunt aliqua duis reprehenderit nulla non. Ad excepteur minim est voluptate dolor cillum deserunt. Sit veniam minim duis laboris exercitation sit.\r\n",
  },
  {
    "price": "\$90,396.10",
    "picture": "images/house-7.jpg",
    "name": "Malibu",
    "category": "Classic Mansion",
    "description":
        "Nisi non officia reprehenderit quis culpa id irure labore. Fugiat cillum esse exercitation fugiat ipsum qui irure Lorem culpa. Laboris est irure veniam minim magna anim velit dolore nisi eu commodo commodo.\r\n",
  },
  {
    "price": "\$89,396.10",
    "picture": "images/house-8.jpg",
    "name": "Prairie House",
    "category": "Modern",
    "description":
        "Nisi non officia reprehenderit quis culpa id irure labore. Fugiat cillum esse exercitation fugiat ipsum qui irure Lorem culpa. Laboris est irure veniam minim magna anim velit dolore nisi eu commodo commodo.\r\n",
  },
  {
    "price": "\$402,396.10",
    "picture": "images/house-9.jpg",
    "name": "Minnesota Classic",
    "category": "Classic",
    "description":
        "Eu qui ipsum non est deserunt velit eiusmod ad qui ex eiusmod tempor consequat. Eu labore ad laborum voluptate exercitation. Aliquip irure non eu dolor labore laborum tempor. Commodo et id labore nisi adipisicing in magna excepteur ut proident et officia. Quis sit veniam consectetur aliqua ipsum occaecat excepteur culpa.\r\n",
  },
  {
    "price": "\$32,396.10",
    "picture": "images/house-10.jpg",
    "name": "Highrise No. 5",
    "category": "Apartments",
    "description":
        "Enim ut laborum duis velit velit duis. Proident excepteur est laborum consequat. Consectetur magna do ex officia excepteur aliquip aliquip reprehenderit consequat pariatur pariatur voluptate et elit. Aliqua exercitation nostrud sunt aliquip excepteur. Do ea officia velit duis aliquip amet. Quis Lorem qui ea minim ullamco culpa anim do sit voluptate fugiat.\r\n",
  },
];
