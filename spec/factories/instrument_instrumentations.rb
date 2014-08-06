# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :instrument_instrumentation, :class => 'InstrumentInstrumentations' do
    instrument nil
    instrumentation nil
  end
end
