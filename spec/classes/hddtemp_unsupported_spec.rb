require 'spec_helper'

describe 'hddtemp' do
  context 'unsupported operating system' do
    context 'hddtemp class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      context 'fails on unsupported platforms' do
        it { expect { should create_class('hddtemp') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
      end
    end
  end
end
