require 'spec_helper'

describe 'doismellburning' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "doismellburning class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('doismellburning::params') }

        it { should contain_class('doismellburning::install') }
        it { should contain_class('doismellburning::config') }
        it { should contain_class('doismellburning::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'doismellburning class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
