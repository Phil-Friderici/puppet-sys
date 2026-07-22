# frozen_string_literal: true

require 'spec_helper'

describe 'sys::solaris' do
  on_supported_os(
    supported_os: [
      {
        'operatingsystem'        => 'Solaris',
        'operatingsystemrelease' => ['11'],
      },
    ],
  ).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
