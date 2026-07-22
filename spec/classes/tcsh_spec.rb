# frozen_string_literal: true

require 'spec_helper'

describe 'sys::tcsh' do
  on_supported_os(
    supported_os: [
      {
        'operatingsystem' => 'Debian',
        'operatingsystemrelease' => ['10'],
      },
      {
        'operatingsystem' => 'CentOS',
        'operatingsystemrelease' => ['7'],
      },
      {
        'operatingsystem' => 'RedHat',
        'operatingsystemrelease' => ['7'],
      },
    ],
  ).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
