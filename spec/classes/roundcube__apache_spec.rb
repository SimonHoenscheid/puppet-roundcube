require 'spec_helper'

describe 'roundcube::apache' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/tmp'
        })
      end

      let(:pre_condition) do
        "class { 'roundcube': }"
      end

      it { should contain_class('roundcube') }
      it { should contain_class('roundcube::apache') }

      it { should contain_apache__custom_config('roundcube') }
      it { should contain_apache__custom_config('roundcube-alias') }
    end
  end
end