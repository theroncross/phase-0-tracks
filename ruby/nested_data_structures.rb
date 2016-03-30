menu = {
  appetizers: {
    nachos: {
      fancy_name: "World's Best Nachos",
      ingredients: [
        "chips",
        "olives",
        "nacho cheese"
      ]
    },
    noodle_soup: {
      fancy_name: "Grandma's Chicken Soup",
      ingredients: [
        "water",
        "spaghetti",
        "salt",
        "chicken scraps"
      ]
    }
  },
  entrees: {
    sandwhich: {
      fancy_name: "4-cheese Panini",
      ingredients: [
        "Wonder Bread",
        "Velveta"
      ]
    },
    fish: {
      fancy_name: "Pan-seared Whitefish",
      ingredients: [
        "Tilapia",
        "Corn oil",
        "Salt and pepper"
      ]
    }
  },
  desserts: {
    cheesecake: {
      fancy_name: "Home-made New York Cheesecake",
      ingredients: [
        "store-bought pie crust",
        "Velveta",
        "Sugar"
      ]
    }
  }
}

p menu[:appetizers][:nachos][:ingredients][1]