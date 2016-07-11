require 'spec_helper'

describe 'hddtemp' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge(
            {
              :blockdevices => 'sda',
            }
          )
        end

        context "hddtemp class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to create_class('hddtemp') }

          it { is_expected.to contain_class('hddtemp::params') }
          it { is_expected.to contain_class('hddtemp::install').that_comes_before('Class[hddtemp::config]') }
          it { is_expected.to contain_class('hddtemp::config') }
          it { is_expected.to contain_class('hddtemp::service').that_subscribes_to('Class[hddtemp::config]') }

          it { is_expected.to contain_service('hddtemp') }
          it { is_expected.to contain_package('hddtemp').with_ensure('present') }

        end
      end
    end
  end
end
