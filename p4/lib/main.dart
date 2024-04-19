class ShoppingCart {
  Map<String, int> items = {};

  // Method to add items to the cart
  void addItem(String itemName, int quantity) {
    if (items.containsKey(itemName)) {
      items[itemName] += quantity;
    } else {
      items[itemName] = quantity;
    }
  }

  // Method to remove items from the cart
  void removeItem(String itemName, int quantity) {
    if (items.containsKey(itemName)) {
      if (items[itemName] <= quantity) {
        items.remove(itemName);
      } else {
        items[itemName] -= quantity;
      }
    }
  }

  // Method to calculate the total price
  double calculateTotalPrice(Map<String, double> prices) {
    double totalPrice = 0;
    items.forEach((itemName, quantity) {
      if (prices.containsKey(itemName)) {
        totalPrice += prices[itemName]! * quantity;
      }
    });
    return totalPrice;
  }

  // Method to apply discounts based on quantity and type of items
  double applyDiscounts(Map<String, double> discounts) {
    double discountAmount = 0;
    items.forEach((itemName, quantity) {
      if (discounts.containsKey(itemName)) {
        discountAmount += discounts[itemName]! * quantity;
      }
    });
    return discountAmount;
  }
}

void main() {
  // Example usage
  var cart = ShoppingCart();

  // Add items to the cart
  cart.addItem('Laptop', 1);
  cart.addItem('Phone', 2);
  cart.addItem('Headphones', 1);

  // Remove items from the cart
  cart.removeItem('Phone', 1);

  // Prices of items
  var prices = {
    'Laptop': 1000,
    'Phone': 500,
    'Headphones': 100,
  };

  // Discounts based on quantity and type of items
  var discounts = {
    'Phone': 50, // $50 discount for each phone
  };

  // Calculate total price
  double totalPrice = cart.calculateTotalPrice(prices);
  print('Total Price: \$${totalPrice.toStringAsFixed(2)}');

  // Apply discounts
  double discountAmount = cart.applyDiscounts(discounts);
  print('Discount Amount: \$${discountAmount.toStringAsFixed(2)}');

  // Final price after discounts
  double finalPrice = totalPrice - discountAmount;
  print('Final Price: \$${finalPrice.toStringAsFixed(2)}');
}
