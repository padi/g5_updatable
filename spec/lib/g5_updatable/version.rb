require "spec_helper"

describe G5Updatable::VERSION do
  it "should have a version" do
    expect(G5Updatable::VERSION).to_not be_blank
  end
end
