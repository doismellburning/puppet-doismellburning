require 'spec_helper'

describe 'doismellburning::install' do
  describe 'doismellburning::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_package('foo') }
  end

  describe 'doismellburning::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_package('foo') }
  end
end
