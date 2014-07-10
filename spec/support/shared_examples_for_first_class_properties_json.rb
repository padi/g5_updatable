shared_examples_for "a model with first-class properties" do
  describe "properties" do
    let(:instance) { FactoryGirl.build(instance_factory_name, properties: { key: "value" }) }

    context "when properties are on an instance from the database" do
      before do
        instance.save!
      end
      subject { instance.class.find(instance.id) }

      its(:key) { should eq("value") }
    end

    context "when properties were set on an in-memory instance" do
      context "trying to access an existing property" do
        subject { instance.key }
        it { should eq("value") }
      end

      context "trying to access an nonexistent property" do
        subject { instance.bad }

        it "blows up normally" do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end
  end
end
