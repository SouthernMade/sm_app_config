describe SmAppConfig, "#configure" do
  let(:configuration_options) { {} }

  before { SmAppConfig.configure(configuration_options) }
  after  { SmAppConfig.clear! }

  it "has sane defaults" do
    expect(SmAppConfig.config_file).to eq("config/app_config.yml")
  end

  context "overriding defaults" do
    let(:path) { "custom/app_config.yml" }
    let(:configuration_options) { { path: path } }

    it "uses the passed values" do
      expect(SmAppConfig.config_file).to eq(path)
    end
  end
end

describe SmAppConfig, "::VERSION" do
  subject { SmAppConfig::VERSION }

  it "responds" do
    expect { subject }.to_not raise_error
  end
end