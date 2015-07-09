require 'spec_helper'

describe 'roundcube::install' do

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
      it { should contain_class('roundcube::install') }

      pending
    end
  end
end