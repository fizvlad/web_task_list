# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
family = Project.create(title: 'Семья')
work   = Project.create(title: 'Работа')
other  = Project.create(title: 'Прочее')


buy_milk = Todo.create(text: 'Купить молоко', isCompleted: false, project: family)
replace_oil = Todo.create(text: 'Заменить масло в двигателе до 23 апреля', isCompleted: false, project: family)
send_letter = Todo.create(text: 'Отправить письмо бабушке', isCompleted: true, project: family)
pay_rent = Todo.create(text: 'Заплатить за квартиру', isCompleted: false, project: family)
pick_up_shoes = Todo.create(text: 'Забрать обувь из ремонта', isCompleted: false, project: family)

call_customer = Todo.create(text: 'Позвонить заказчику', isCompleted: true, project: work)
send_documents = Todo.create(text: 'Отправить документы', isCompleted: true, project: work)
fill_report = Todo.create(text: 'Заполнить отчет', isCompleted: false, project: work)

call_friend = Todo.create(text: 'Позвонить другу', isCompleted: false, project: other)
prepare_for_trip = Todo.create(text: 'Подготовиться к поездке', isCompleted: false, project: other)
