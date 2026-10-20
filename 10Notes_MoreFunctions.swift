
//We are going to write some more functions to better prepare us for 
//making apps that have more functionality!


//Calculate a bill + tip
func tipCalculator(total: Double, tipPercentDecimal: Double) -> Double {
    return total * tipPercentDecimal + total
}

print(tipCalculator(total: 10, tipPercentDecimal: 0.10))
print(tipCalculator(total: 100, tipPercentDecimal: 0.25))


//Calculate a bill + tip when gratuity is included
//If the bill is $300 or greater, a 20% tip is applied.
//Else, an 18% tip is applied.
//If the bill is negative or 0, return -1.
func tipCalculatorPlus(total: Double) -> Double {
    if (total >= 300){
        return total * 0.20 + total
    }
    else if (total > 0 && total < 300) {
            return total * 0.18 + total
        }
    else{
        return -1
    }
}

print(tipCalculatorPlus(total: 100))
print(tipCalculatorPlus(total: 400))
print(tipCalculatorPlus(total: -100))

//calculate a price
func costForToppings(pepperoni: Bool, mushroom: Bool, extraCheese: Bool) -> Double{
    var price = 15.0
    
    if pepperoni {
        price = price + 3
    }
    if mushroom {
        price = price + 1
    }
    if extraCheese {
        price = price + 2
    }
    return price
}

print(costForToppings(pepperoni: true, mushroom: false, extraCheese: true))


//bagsNeeded
//
// How many bags to carry some items, if each bag holds
// only so many.
//
//   10 items, bag carries 3 each  ->  4 bags needed 
//   9 items,  bag carries 3 each  ->  3 bags needed
//   2 items,  bag carries 5 each  ->  1 bag needed
//   0 items,  bag carries 5 each  ->  you have no items
// ==========================================================

func bagsNeeded(items: Int, perBag: Int) -> Int {
    var numBags = items/perBag
    var leftOver = items - numBags * perBag 
    if leftOver > 0 {
        numBags = numBags + 1
    }
    return numBags
}

print(bagsNeeded(items: 10, perBag: 3))
print(bagsNeeded(items: 9, perBag: 3))
print(bagsNeeded(items: 2, perBag: 5))
print(bagsNeeded(items: 0, perBag: 5))
