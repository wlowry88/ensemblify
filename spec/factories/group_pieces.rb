# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_piece, :class => 'GroupPieces' do
    group nil
    piece nil
  end
end
