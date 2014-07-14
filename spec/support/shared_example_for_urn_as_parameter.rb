shared_examples_for "a model that uses its URN as its parameter" do
  let(:model) { FactoryGirl.build(instance_factory_name, urn: "test-urn") }

  it "returns the URN as the param" do
    expect(model.to_param).to eq("test-urn")
  end
end
