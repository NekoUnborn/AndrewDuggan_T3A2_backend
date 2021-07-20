# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Medicine.destroy_all

# admin = [
#   {
#     username: ENV['ADMIN_USERNAME'],
#     email: ENV['ADMIN_EMAIL'],
#     password_digest: ENV['ADMIN_PASSWORD'],
#     pin: 12345
#   }
# ]
# User.create(admin)

# children = [
#   { user_id: User.first[:id], name: "Timothy" },
#   { user_id: User.first[:id], name: "Andrew" }
# ]
# Child.create(children)

# ChecklistEntry.destroy_all
# checklist_entries = [
#   {
#     child_id: Child.first[:id],
#     time: '07:00:00',
#     medicine_id: Medicine.create({
#                                      name: "Ritalin LA",
#                                      description: "Helps your concentration skills for 12 hours"
#                                    }).id,
#     complete: false,
#     last_accessed: '2021-07-13'
#   },
#   {
#     child_id: Child.first[:id],
#     time: '19:30:00',
#     medicine_id: Medicine.create({
#                                      name: "Melatonin",
#                                      description: "To help you sleep"
#                                    }).id,
#     complete: false,
#     last_accessed: '2021-07-13'
#   },
#   {
#     child_id: Child.second[:id],
#     time: '07:00:00',
#     medicine_id: Medicine.create({
#                                      name: "Dextroamphetamine",
#                                      description: "Helps your concentration skills for 4 hours"
#                                    }).id,
#     complete: false,
#     last_accessed: '2021-07-13'
#   },
#   {
#     child_id: Child.second[:id],
#     time: '07:00:00',
#     medicine_id: Medicine.create({
#                                      name: "Abilify",
#                                      description: "To help you calm down"
#                                    }).id,
#     complete: false,
#     last_accessed: '2021-07-13'
#   }
# ]
# ChecklistEntry.create(checklist_entries)

# rewards = [
#   {
#     child_id: Child.first[:id],
#     date: '2021-07-12'
#   },
#   {
#     child_id: Child.first[:id],
#     date: '2021-07-11'
#   },
#   {
#     child_id: Child.second[:id],
#     date: '2021-07-12'
#   },
#   {
#     child_id: Child.second[:id],
#     date: '2021-07-11'
#   }
# ]

# Reward.create(rewards)
Medicine.destroy_all
Medicine.create(name: 'Med1', description: 'Test Desc1')
Medicine.create(name: 'Med2', description: 'Test Desc2')
Medicine.create(name: 'Med3', description: 'Test Desc3')
Medicine.create(name: 'Med4', description: 'Test Desc4')
