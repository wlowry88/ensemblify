# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }},{name: { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Instrumentation.create([{name: 'string trio'}, {name: 'piano trio'}, {name: 'string quartet'}, {name: 'piano quartet'}, {name: 'wind quintet'}, {name: 'reed trio'}, {name: 'brass quintet'}, {name: 'pierrot ensemble'}])

Instrument.create([{name: ""},{name:"violin"},{name: "viola"},{name: "cello"},{name: "bass"},{name: "harp"},{name: "guitar"},{name: "flute"},{name: "clarinet"},{name: "oboe"},{name: "bassoon"},{name: "french horn"},{name: "trumpet"},{name: "trombone"},{name: "tuba"},{name: "piano"},{name: "voice"},{name: "percussion"},{name: "saxophone"}])

Instrumentation.find_by(name: 'string trio').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'string trio').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'string trio').instruments << (Instrument.find_by(name: 'cello'))

Instrumentation.find_by(name: 'piano trio').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'piano trio').instruments << (Instrument.find_by(name: 'piano'))
Instrumentation.find_by(name: 'piano trio').instruments << (Instrument.find_by(name: 'cello'))

Instrumentation.find_by(name: 'string quartet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'string quartet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'string quartet').instruments << (Instrument.find_by(name: 'cello'))