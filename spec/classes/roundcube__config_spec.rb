require 'spec_helper'

describe 'roundcube::config' do

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
      it { should contain_class('roundcube::config') }

      it { should contain_file('roundcube main.inc.php').with({
        :path => '/etc/roundcube/main.inc.php',
      }) }

      it { should contain_file('roundcube main.inc.php').with_content(/junk_mbox.*=\s*'Junk E-Mail';/) }
      it { should contain_file('roundcube main.inc.php').with_content(/drafts_mbox.*=\s*'Drafts';/) }
      it { should contain_file('roundcube main.inc.php').with_content(/sent_mbox.*=\s*'Sent Items';/) }
      it { should contain_file('roundcube main.inc.php').with_content(/trash_mbox.*=\s*'Deleted Items';/) }
    end
  end
end