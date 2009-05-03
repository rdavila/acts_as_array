ActiveRecord::Schema.define(:version => 0) do
  create_table :preferences, :force => true do |t|
    t.string :colors, :hobbies
  end
end
