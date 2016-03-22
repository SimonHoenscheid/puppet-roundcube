require 'spec_helper'

describe 'roundcube::apache' do
  let(:facts) do
    on_supported_os['debian-8-x86_64'].merge({
      :concat_basedir => '/tmp'
    })
  end

  context "with default settings" do
    let(:pre_condition) do
      "class { 'roundcube': }"
    end

    it { should contain_class('roundcube') }
    it { should contain_class('roundcube::apache') }

    it { should contain_apache__custom_config('roundcube') }
    it { should contain_apache__custom_config('roundcube-alias')
      .with(
        :content => /Alias \/roundcube/,
      )
    }
  end

  context "with changed parameters" do
    let(:pre_condition) do
      "class { 'roundcube':
        web_uri => '/webmail',
      }"
    end

    it { should contain_apache__custom_config('roundcube-alias')
      .with(
        :content => /Alias \/webmail/,
      )
    }
  end
end