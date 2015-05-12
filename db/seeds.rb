Cat.create!(name: 'Garfield', sex: 'M', birth_date: 47.months.ago, color: 'red')
Cat.create!(name: 'Spinkles', sex: 'F', birth_date: 65.months.ago, color: 'calico')
Cat.create!(name: 'Ludwig', sex: 'M', birth_date: 88.months.ago, color: 'brown')

CatRentalRequest.create!(cat_id: 1, start_date: 12.days.ago, end_date: 8.days.ago, status: 'APPROVED')
CatRentalRequest.create!(cat_id: 1, start_date: 5.days.ago, end_date: 4.days.ago, status: 'DENIED')
CatRentalRequest.create!(cat_id: 1, start_date: 3.days.ago, end_date: 1.days.ago, status: 'DENIED')
CatRentalRequest.create!(cat_id: 2, start_date: 26.days.ago, end_date: 1.days.ago, status: 'APPROVED')
