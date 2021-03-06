# require 'rails_helper'
#
# RSpec.describe Household do
#   it 'it should build a Household PORO' do
#     chore1 = Chore.new({ data: {id: "1", type: "chore",
#                     attributes: {
#                       task_name: 'Do',
#                       description: 'do it',
#                       household_id: 91,
#                       id: 1,
#                       weight: 2,
#                       frequency: 'weekly',
#                       outdoor: true
#                     }
#                   }})
#
#     chore2 = Chore.new({ data: {id: "2", type: "chore",
#                     attributes: {
#                       task_name: 'Dont Mow',
#                       description: 'no mow',
#                       household_id: 91,
#                       id: 2,
#                       weight: 3,
#                       frequency: 'daily',
#                       outdoor: false
#                     }
#                   }})
#     attributes = {
#       "data": {
#         "id": "91",
#         "type": "households",
#         "attributes": {
#           "address": "9385 Dooley Plains",
#           "city": "denver",
#           "state": "co",
#           "roommates": [],
#           "chores": [chore1, chore2],
#           "weather_forecast": {
#             "id": "nil",
#             "current_weather": {
#               "datetime": "2021-08-02 18:58:52 -0400",
#               "sunrise": "08:00",
#               "sunset": "22:12",
#               "temperature": 303,
#               "feels_like": 301.76,
#               "humidity": 30,
#               "uvi": 2.8,
#               "visibility": 10000,
#               "conditions": "broken clouds",
#               "icon": "04d"
#             },
#             "daily_weather": [
#               {
#                 "date": "2021-08-02",
#                 "sunrise": "08:00",
#                 "sunset": "22:12",
#                 "max_temp": 303.67,
#                 "min_temp": 292.59,
#                 "conditions": "scattered clouds",
#                 "icon": "03d"
#               },
#               {
#                 "date": "2021-08-03",
#                 "sunrise": "08:01",
#                 "sunset": "22:11",
#                 "max_temp": 298.35,
#                 "min_temp": 293.45,
#                 "conditions": "light rain",
#                 "icon": "10d"
#               },
#               {
#                 "date": "2021-08-04",
#                 "sunrise": "08:01",
#                 "sunset": "22:09",
#                 "max_temp": 305.11,
#                 "min_temp": 293.5,
#                 "conditions": "clear sky",
#                 "icon": "01d"
#               },
#               {
#                 "date": "2021-08-05",
#                 "sunrise": "08:02",
#                 "sunset": "22:08",
#                 "max_temp": 307.77,
#                 "min_temp": 294.13,
#                 "conditions": "clear sky",
#                 "icon": "01d"
#               },
#               {
#                 "date": "2021-08-06",
#                 "sunrise": "08:03",
#                 "sunset": "22:07",
#                 "max_temp": 308.6,
#                 "min_temp": 295.06,
#                 "conditions": "light rain",
#                 "icon": "10d"
#               }
#             ]
#           }
#         }
#       }
#     }
#
#     house = Household.new(attributes)
#
#     expect(house.address).to eq(attributes[:address])
#     expect(house.city).to eq(attributes[:city])
#     expect(house.state).to eq(attributes[:state])
#     expect(house.roommates).to eq(attributes[:roommates])
#     expect(house.chores).to eq(attributes[:chores])
#     expect(house.weather_forecast).to eq(attributes[:weather_forecast])
#   end
# end
# require 'rails_helper'
#
# RSpec.describe Household do
#   it 'it should build a Household PORO' do
#     chore1 = Chore.new({ data: {id: "1", type: "chore",
#                     attributes: {
#                       task_name: 'Do',
#                       description: 'do it',
#                       household_id: 91,
#                       id: 1,
#                       weight: 2,
#                       frequency: 'weekly',
#                       outdoor: true
#                     }
#                   }})
#
#     chore2 = Chore.new({ data: {id: "2", type: "chore",
#                     attributes: {
#                       task_name: 'Dont Mow',
#                       description: 'no mow',
#                       household_id: 91,
#                       id: 2,
#                       weight: 3,
#                       frequency: 'daily',
#                       outdoor: false
#                     }
#                   }})
#
#     attributes = {
#       "data": {
#         "id": "91",
#         "type": "households",
#         "attributes": {
#           "address": "9385 Dooley Plains",
#           "city": "denver",
#           "state": "co",
#           "roommates": [],
#           "chores": [chore1, chore2],
#           "weather_forecast": {
#             "id": "nil",
#             "current_weather": {
#               "datetime": "2021-08-02 18:58:52 -0400",
#               "sunrise": "08:00",
#               "sunset": "22:12",
#               "temperature": 303,
#               "feels_like": 301.76,
#               "humidity": 30,
#               "uvi": 2.8,
#               "visibility": 10000,
#               "conditions": "broken clouds",
#               "icon": "04d"
#             },
#             "daily_weather": [
#               {
#                 "date": "2021-08-02",
#                 "sunrise": "08:00",
#                 "sunset": "22:12",
#                 "max_temp": 303.67,
#                 "min_temp": 292.59,
#                 "conditions": "scattered clouds",
#                 "icon": "03d"
#               },
#               {
#                 "date": "2021-08-03",
#                 "sunrise": "08:01",
#                 "sunset": "22:11",
#                 "max_temp": 298.35,
#                 "min_temp": 293.45,
#                 "conditions": "light rain",
#                 "icon": "10d"
#               },
#               {
#                 "date": "2021-08-04",
#                 "sunrise": "08:01",
#                 "sunset": "22:09",
#                 "max_temp": 305.11,
#                 "min_temp": 293.5,
#                 "conditions": "clear sky",
#                 "icon": "01d"
#               },
#               {
#                 "date": "2021-08-05",
#                 "sunrise": "08:02",
#                 "sunset": "22:08",
#                 "max_temp": 307.77,
#                 "min_temp": 294.13,
#                 "conditions": "clear sky",
#                 "icon": "01d"
#               },
#               {
#                 "date": "2021-08-06",
#                 "sunrise": "08:03",
#                 "sunset": "22:07",
#                 "max_temp": 308.6,
#                 "min_temp": 295.06,
#                 "conditions": "light rain",
#                 "icon": "10d"
#               }
#             ]
#           }
#         }
#       }
#     }
#
#     house = Household.new(attributes)
#
#     expect(house.address).to eq(attributes[:address])
#     expect(house.city).to eq(attributes[:city])
#     expect(house.state).to eq(attributes[:state])
#     expect(house.roommates).to eq(attributes[:roommates])
#     expect(house.chores).to eq(attributes[:chores])
#     expect(house.weather_forecast).to eq(attributes[:weather_forecast])
#   end
# end
