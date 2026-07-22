# frozen_string_literal: true

require 'spec_helper'

describe 'sys::redhat' do
  on_supported_os(
    supported_os: [
      {
        'operatingsystem' => 'CentOS',
        'operatingsystemrelease' => ['7'],
      },
      {
        'operatingsystem' => 'RedHat',
        'operatingsystemrelease' => ['8'],
      },
    ],
  ).each do |os, os_facts|    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
