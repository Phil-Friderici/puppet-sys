# frozen_string_literal: true

require 'spec_helper'

describe 'sys::ubuntu' do
  on_supported_os(
    supported_os: [
      {
        'operatingsystem' => 'Ubuntu',
        'operatingsystemrelease' => ['22.04'],
      },
      {
        'operatingsystem' => 'Debian',
        'operatingsystemrelease' => ['12'],
      },
    ],
  ).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
