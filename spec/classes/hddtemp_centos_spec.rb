require 'spec_helper'

describe 'hddtemp' do
  context 'on CentOS' do
    let(:facts) {{
      :osfamily                  => 'RedHat',
      :operatingsystemmajrelease => '7',
      :operatingsystem           => 'CentOS',
      :blockdevices              => 'sdz',
    }}

    it { is_expected.to contain_class('epel') }

    it { is_expected.to contain_file('/etc/sysconfig/hddtemp').
      with_content(/DATABASE="\/usr\/share\/misc\/hddtemp.db"/)
    }

    it { is_expected.to contain_file('/etc/sysconfig/hddtemp').
      with_content(/RUN_DAEMON="true"/)
    }

    it { is_expected.to contain_file('/etc/sysconfig/hddtemp').
      with_content(/DISKS="\/dev\/sdz"/)
    }

    it { is_expected.to contain_file('/etc/sysconfig/hddtemp').
      with_content(/RUN_SYSLOG="1800"/)
    }

  end
end
