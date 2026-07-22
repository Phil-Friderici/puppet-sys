# frozen_string_literal: true

require 'spec_helper'

describe 'sys::iptables' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      # FIXME: This module expects an old version of the firewall module and isn't compatible with latest version !!!
      # it { is_expected.to compile.with_all_deps }
    end
  end
end
