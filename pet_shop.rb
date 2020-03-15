def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, pet_name)
  finder = []
  for pet in pet_shop[:pets]
    finder.push(pet) if pet[:breed] == pet_name
  end
  return finder
end

def find_pet_by_name(pet_shop, pet_name)
finder = nil
  for pet in pet_shop[:pets]
    finder = pet if pet[:name] == pet_name
  end
  return finder
end

def remove_pet_by_name(pet_shop, pet_name)
  pet_to_delete = find_pet_by_name(pet_shop, pet_name)
  return pet_shop[:pets].delete(pet_to_delete)
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)
  customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return if pet == nil
  return if !(customer_can_afford_pet(customer, pet))
  add_pet_to_customer(customer, pet)
  increase_pets_sold(pet_shop, 1)
  remove_customer_cash(customer, pet[:price])
  add_or_remove_cash(pet_shop, pet[:price])

  total_cash(pet_shop)
end
