json.my_phones do
  json.array!(@phones) do |phone|
    json.extract! phone, :type, :number
    json.id phone.id
    json.type phone.type
    json.number phone.number
  end
end
