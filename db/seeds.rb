Cat.create!(name: 'Garfield', sex: 'M', birth_date: 47.months.ago, color: 'red', user_id: 1)
Cat.create!(name: 'Sprinkles', sex: 'F', birth_date: 65.months.ago, color: 'calico', user_id: 1, description: "not actually a cat. details upon inquiry.")
Cat.create!(name: 'Ludwig', sex: 'M', birth_date: 88.months.ago, color: 'brown', user_id: 1)
Cat.create!(name: 'Snowball', sex: 'F', birth_date: 88.months.ago, color: 'brown', description: "i found her in the trash", user_id: 2)

CatRentalRequest.create!(cat_id: 1, start_date: 7.days.ago, end_date: 4.days.ago, status: 'APPROVED', user_id: 1)
CatRentalRequest.create!(cat_id: 1, start_date: 3.days.ago, end_date: 3.days.ago, status: 'DENIED', user_id: 1)
CatRentalRequest.create!(cat_id: 1, start_date: 3.days.ago, end_date: 1.days.ago, status: 'DENIED', user_id: 1)
CatRentalRequest.create!(cat_id: 2, start_date: 26.days.ago, end_date: 1.days.ago, status: 'APPROVED', user_id: 1)

User.create!(user_name: "Hannibal", password: "hannibal")
User.create!(user_name: "Loren", password: "lorenloren")
