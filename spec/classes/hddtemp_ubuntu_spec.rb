require 'spec_helper'

describe 'hddtemp' do
  context 'on Ubuntu' do
    let(:facts) {{
      :osfamily                  => 'Debian',
      :operatingsystemmajrelease => '16.04',
      :operatingsystem           => 'Ubuntu',
      :lsbdistid                 => 'Ubuntu',
      :lsbdistcodename           => 'xenial',
      :lsbdistrelease            => '16.04',
      :blockdevices              => 'sdz',
    }}

    it { is_expected.to contain_file('/etc/default/hddtemp').
      with_content(/DATABASE="\/usr\/share\/misc\/hddtemp.db"/)
    }

    it { is_expected.to contain_file('/etc/default/hddtemp').
      with_content(/RUN_DAEMON="true"/)
    }

    it { is_expected.to contain_file('/etc/default/hddtemp').
      with_content(/DISKS="\/dev\/sdz"/)
    }

    it { is_expected.to contain_file('/etc/default/hddtemp').
      with_content(/RUN_SYSLOG="1800"/)
    }

  end
end
