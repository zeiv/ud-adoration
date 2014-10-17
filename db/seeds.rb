# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create([
  {title: 'admin'},
  {title: 'user'}
]) if Role.count == 0

users = User.create([
  {first_name: 'Xavier', last_name: 'Bick', email: 'fxb9500@gmail.com', password: 'CHANGEME', role: Role.find_by(title: 'admin')}
]) if User.count == 0

config_vars = ConfigVar.create([
  {name: :system_enabled.to_s, boolean_value: true}
]) if ConfigVar.count == 0
