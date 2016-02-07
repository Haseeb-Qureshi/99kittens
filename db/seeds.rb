User.create!(user_name: "Hannibal", password: "hannibal")
User.create!(user_name: "Loren", password: "lorenloren")
User.create!(user_name: "Sal", password: "salsal")
User.create!(user_name: "Mindy", password: "mindymindy")
User.create!(user_name: "Rambo", password: "ramborambo")

Cat.create!(name: 'Garfield', sex: 'M', birth_date: 47.months.ago, color: 'red', user_id: 1, description: "abhors Mondays")
Cat.create!(name: 'Sprinkles', sex: 'F', birth_date: 65.months.ago, color: 'calico', user_id: 4, description: "not actually a cat. details upon inquiry.")
Cat.create!(name: 'Ludwig', sex: 'M', birth_date: 88.months.ago, color: 'brown', user_id: 3, description: "SPEAKS ENGLISH WHEN MY WIFE ISNT AROUND")
Cat.create!(name: 'Snowball', sex: 'F', birth_date: 14.months.ago, color: 'brown', description: "will accept vaccuum cleaner as trade", user_id: 2)
Cat.create!(name: 'Mindy', sex: 'F', birth_date: 12.months.ago, color: 'brown', description: "i found her in the trash", user_id: 4)
Cat.create!(name: 'Bingo', sex: 'M', birth_date: 8.months.ago, color: 'brown', description: "Won't stop judging me. Please rent.", user_id: 2)



CatRentalRequest.create!(cat_id: 2, start_date: 7.days.ago, end_date: 4.days.ago, status: 'APPROVED', user_id: 1)
CatRentalRequest.create!(cat_id: 3, start_date: 3.days.ago, end_date: 3.days.ago, status: 'DENIED', user_id: 1)
CatRentalRequest.create!(cat_id: 4, start_date: 3.days.ago, end_date: 1.days.ago, status: 'DENIED', user_id: 1)
CatRentalRequest.create!(cat_id: 5, start_date: 3.days.ago, end_date: 1.days.ago, status: 'PENDING', user_id: 1)

CatRentalRequest.create!(cat_id: 2, start_date: 26.days.ago, end_date: 16.days.ago, status: 'APPROVED', user_id: 4)
CatRentalRequest.create!(cat_id: 3, start_date: 18.days.ago, end_date: 15.days.ago, status: 'APPROVED', user_id: 5)
CatRentalRequest.create!(cat_id: 4, start_date: 13.days.ago, end_date: 4.days.ago, status: 'DENIED', user_id: 2)
CatRentalRequest.create!(cat_id: 6, start_date: 55.days.ago, end_date: 34.days.ago, status: 'APPROVED', user_id: 3)
