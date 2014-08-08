# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }},{name: { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Instrumentation.create([
  {name: 'string trio'}, 
  {name: 'string quartet'}, 
  {name: 'string sextet'}, 
  {name: 'string octet'},
  {name: 'piano trio'}, 
  {name: 'piano quartet'}, 
  {name: 'piano quintet'},
  {name: 'reed trio'}, 
  {name: 'horn trio'}, 
  {name: 'brass quintet'}, 
  {name: 'flute quartet'},
  {name: 'clarinet quintet'},
  {name: 'wind quintet'}, 
  {name: 'wind octet'},
  {name: 'pierrot ensemble'}
])

Instrument.create([
  {name: "violin"},
  {name: "viola"},
  {name: "cello"},
  {name: "bass"},
  {name: "harp"},
  {name: "guitar"},
  {name: "flute"},
  {name: "clarinet"},
  {name: "oboe"},
  {name: "bassoon"},
  {name: "horn"},
  {name: "trumpet"},
  {name: "trombone"},
  {name: "tuba"},
  {name: "piano"},
  {name: "voice"},
  {name: "percussion"},
  {name: "saxophone"}])

Instrumentation.find_by(name: 'string trio').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'string trio').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'string trio').instruments << (Instrument.find_by(name: 'cello'))

Instrumentation.find_by(name: 'string quartet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'string quartet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'string quartet').instruments << (Instrument.find_by(name: 'cello'))
violins_in_string_quartet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("violin"), instrumentation: Instrumentation.find_by_name("string quartet"))
violins_in_string_quartet.quantity = 2
violins_in_string_quartet.save

Instrumentation.find_by(name: 'string sextet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'string sextet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'string sextet').instruments << (Instrument.find_by(name: 'cello'))
violins_in_string_sextet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("violin"), instrumentation: Instrumentation.find_by_name("string sextet"))
violins_in_string_sextet.quantity = 2
violins_in_string_sextet.save
violas_in_string_sextet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("viola"), instrumentation: Instrumentation.find_by_name("string sextet"))
violas_in_string_sextet.quantity = 2
violas_in_string_sextet.save
cellos_in_string_sextet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("cello"), instrumentation: Instrumentation.find_by_name("string sextet"))
cellos_in_string_sextet.quantity = 2
cellos_in_string_sextet.save

Instrumentation.find_by(name: 'string octet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'string octet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'string octet').instruments << (Instrument.find_by(name: 'cello'))
violins_in_string_octet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("violin"), instrumentation: Instrumentation.find_by_name("string octet"))
violins_in_string_octet.quantity = 4
violins_in_string_octet.save
violas_in_string_octet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("viola"), instrumentation: Instrumentation.find_by_name("string octet"))
violas_in_string_octet.quantity = 2
violas_in_string_octet.save
cellos_in_string_octet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("cello"), instrumentation: Instrumentation.find_by_name("string octet"))
cellos_in_string_octet.quantity = 2
cellos_in_string_octet.save

Instrumentation.find_by(name: 'piano trio').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'piano trio').instruments << (Instrument.find_by(name: 'cello'))
Instrumentation.find_by(name: 'piano trio').instruments << (Instrument.find_by(name: 'piano'))

Instrumentation.find_by(name: 'piano quartet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'piano quartet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'piano quartet').instruments << (Instrument.find_by(name: 'cello'))
Instrumentation.find_by(name: 'piano quartet').instruments << (Instrument.find_by(name: 'piano'))

Instrumentation.find_by(name: 'piano quintet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'piano quintet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'piano quintet').instruments << (Instrument.find_by(name: 'cello'))
Instrumentation.find_by(name: 'piano quintet').instruments << (Instrument.find_by(name: 'piano'))
violins_in_piano_quintet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("violin"), instrumentation: Instrumentation.find_by_name("piano quintet"))
violins_in_piano_quintet.quantity = 2
violins_in_piano_quintet.save

Instrumentation.find_by(name: 'reed trio').instruments << (Instrument.find_by(name: 'oboe'))
Instrumentation.find_by(name: 'reed trio').instruments << (Instrument.find_by(name: 'clarinet'))
Instrumentation.find_by(name: 'reed trio').instruments << (Instrument.find_by(name: 'bassoon'))

Instrumentation.find_by(name: 'horn trio').instruments << (Instrument.find_by(name: 'horn'))
Instrumentation.find_by(name: 'horn trio').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'horn trio').instruments << (Instrument.find_by(name: 'piano'))

Instrumentation.find_by(name: 'brass quintet').instruments << (Instrument.find_by(name: 'trumpet'))
Instrumentation.find_by(name: 'brass quintet').instruments << (Instrument.find_by(name: 'horn'))
Instrumentation.find_by(name: 'brass quintet').instruments << (Instrument.find_by(name: 'trombone'))
Instrumentation.find_by(name: 'brass quintet').instruments << (Instrument.find_by(name: 'tuba'))
trumpets_in_brass_quintet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("trumpet"), instrumentation: Instrumentation.find_by_name("brass quintet"))
trumpets_in_brass_quintet.quantity = 2
trumpets_in_brass_quintet.save

Instrumentation.find_by(name: 'flute quartet').instruments << (Instrument.find_by(name: 'flute'))
Instrumentation.find_by(name: 'flute quartet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'flute quartet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'flute quartet').instruments << (Instrument.find_by(name: 'cello'))

Instrumentation.find_by(name: 'clarinet quintet').instruments << (Instrument.find_by(name: 'clarinet'))
Instrumentation.find_by(name: 'clarinet quintet').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'clarinet quintet').instruments << (Instrument.find_by(name: 'viola'))
Instrumentation.find_by(name: 'clarinet quintet').instruments << (Instrument.find_by(name: 'cello'))
violins_in_clarinet_quintet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("violin"), instrumentation: Instrumentation.find_by_name("clarinet quintet"))
violins_in_clarinet_quintet.quantity = 2
violins_in_clarinet_quintet.save

Instrumentation.find_by(name: 'wind quintet').instruments << (Instrument.find_by(name: 'flute'))
Instrumentation.find_by(name: 'wind quintet').instruments << (Instrument.find_by(name: 'clarinet'))
Instrumentation.find_by(name: 'wind quintet').instruments << (Instrument.find_by(name: 'oboe'))
Instrumentation.find_by(name: 'wind quintet').instruments << (Instrument.find_by(name: 'bassoon'))
Instrumentation.find_by(name: 'wind quintet').instruments << (Instrument.find_by(name: 'horn'))

Instrumentation.find_by(name: 'wind octet').instruments << (Instrument.find_by(name: 'oboe'))
Instrumentation.find_by(name: 'wind octet').instruments << (Instrument.find_by(name: 'clarinet'))
Instrumentation.find_by(name: 'wind octet').instruments << (Instrument.find_by(name: 'horn'))
Instrumentation.find_by(name: 'wind octet').instruments << (Instrument.find_by(name: 'bassoon'))
oboes_in_wind_octet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("oboe"), instrumentation: Instrumentation.find_by_name("wind octet"))
oboes_in_wind_octet.quantity = 2
oboes_in_wind_octet.save
clarinets_in_wind_octet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("clarinet"), instrumentation: Instrumentation.find_by_name("wind octet"))
clarinets_in_wind_octet.quantity = 2
clarinets_in_wind_octet.save
horns_in_wind_octet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("horn"), instrumentation: Instrumentation.find_by_name("wind octet"))
horns_in_wind_octet.quantity = 2
horns_in_wind_octet.save
bassoons_in_wind_octet = InstrumentInstrumentation.find_by(instrument: Instrument.find_by_name("bassoon"), instrumentation: Instrumentation.find_by_name("wind octet"))
bassoons_in_wind_octet.quantity = 2
bassoons_in_wind_octet.save

Instrumentation.find_by(name: 'pierrot ensemble').instruments << (Instrument.find_by(name: 'flute'))
Instrumentation.find_by(name: 'pierrot ensemble').instruments << (Instrument.find_by(name: 'clarinet'))
Instrumentation.find_by(name: 'pierrot ensemble').instruments << (Instrument.find_by(name: 'violin'))
Instrumentation.find_by(name: 'pierrot ensemble').instruments << (Instrument.find_by(name: 'cello'))
Instrumentation.find_by(name: 'pierrot ensemble').instruments << (Instrument.find_by(name: 'piano'))