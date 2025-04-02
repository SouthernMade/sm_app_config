describe AppConfig, ".[]" do
  it "gets a setting from the environment preferentially" do
    ENV["SOME_DEMO_SETTING"] = "99 paper-planes"
    expect(
      AppConfig["some_demo_setting"]
    ).to eq("99 paper-planes")
  ensure
    ENV["SOME_DEMO_SETTING"] = nil
  end

  it "converts integer environment values" do
    ENV["AN_INTEGER_IN_ENV"] = "99"
    expect(
      AppConfig["an_integer_in_env"]
    ).to eq(99)
  ensure
    ENV["AN_INTEGER_IN_ENV"] = nil
  end

  it "converts true boolean environment values" do
    ENV["BOOLEAN_TRUE"] = "true"
    expect(
      AppConfig["boolean_true"]
    ).to eq(true)
  ensure
    ENV["BOOLEAN_TRUE"] = nil
  end

  it "converts false boolean environment values" do
    ENV["BOOLEAN_FALSE"] = "false"
    expect(
      AppConfig["boolean_false"]
    ).to eq(false)
  ensure
    ENV["BOOLEAN_FALSE"] = nil
  end

  it "will fall back to try loading from a file" do
    expect(
      AppConfig["sample_basic_setting"]
    ).to eq("my-setting")
  end

  it "will load a false just fine" do
    expect(
      AppConfig["very_false"]
    ).to eq(false)
  end

  it "will complain loudly over missing values" do
    expect {
      AppConfig["just_not_there"]
    }.to raise_error(ArgumentError, /just_not_there/)
  end

  it "will complain loudly if configuration file does not exist" do
    SmAppConfig.configure(path: "custom/app_config.yml")
    AppConfig.reload!
    expect {
      AppConfig["any_setting"]
    }.to raise_error(StandardError, /custom/)
  ensure
    SmAppConfig.clear!
  end

  context "Rails application" do
    before(:each) do
      AppConfig.reload!
      stub_const("Rails", Module.new)
      allow(Rails).to receive(:env).and_return("test")
    end

    it "will look for the value in the correct environment" do
      expect(
        AppConfig["rails_setting"]
      ).to eq(true)
    end
  end
end
