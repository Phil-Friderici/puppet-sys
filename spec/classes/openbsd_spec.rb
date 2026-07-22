# frozen_string_literal: true

require 'spec_helper'

describe 'sys::openbsd' do
  on_supported_os(
    supported_os: [
      {
        'operatingsystem' => 'OpenBSD',
        'operatingsystemrelease' => ['7'],
      },
    ],
  ).each do |os, os_facts|    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
