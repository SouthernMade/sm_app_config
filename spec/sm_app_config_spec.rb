require 'spec_helper'

describe SmAppConfig, "#configure" do
  let(:configuration_options) { {} }

  subject { SmAppConfig.configure(configuration_options) }

  it "has sane defaults" do
    subject
    expect(SmAppConfig::CONFIG.fetch(:path)).to eq("config/app_config.yml")
  end

  context "overriding defaults" do
    let(:path) { "custom/app_config.yml" }
    let(:configuration_options) { { path: path } }

    after(:each) { SmAppConfig.clear! }

    it "uses the passed values" do
      subject
      expect(SmAppConfig::CONFIG.fetch(:path)).to eq(path)
    end
  end
end

describe SmAppConfig, "::VERSION" do
  subject { SmAppConfig::VERSION }

  it "responds" do
    expect { subject }.to_not raise_error
  end
end