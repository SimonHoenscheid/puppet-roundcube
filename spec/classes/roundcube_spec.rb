require 'spec_helper'

describe 'roundcube' do

  on_supported_os.each do |os, facts|
    let(:facts) do
      facts.merge({
        :concat_basedir => '/tmp'
      })
    end

    context "on #{os} with defaults" do

      it { should compile.with_all_deps }

      it { should contain_class('roundcube') }
      it { should contain_class('roundcube::apache') }
      it { should contain_class('roundcube::install') }
      it { should contain_class('roundcube::config') }
      it { should contain_class('roundcube::dbconfig') }
    end

    context "on #{os} with changed parameters" do
      let(:params) do
        {
          :manage_apache_config => false,
        }
      end

      it { should compile.with_all_deps }

      it { should contain_class('roundcube') }
      it { should contain_class('roundcube::params') }

      it { should_not contain_class('roundcube::apache') }
      it { should_not contain_class('apache') }
    end
  end
end