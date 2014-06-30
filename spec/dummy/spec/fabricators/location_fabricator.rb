Fabricator :location do
  uid { "http://foo.com" }
  urn { "g5-cl-2398223-#{Faker::Name.name.parameterize}" }
  name { Faker::Name.name }
  state { Faker::Address.state_abbr }
  city { Faker::Address.city }
  domain { "http://bar.com" }
  corporate { false }
end
