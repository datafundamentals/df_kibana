#
# Cookbook Name:: df_kibana
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'df_kibana::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'creates kibana directory' do
      expect(chef_run).to create_directory('/opt/kibana')
    end
    it 'creates config template' do 
    	expect(chef_run).to create_template('/opt/kibana/config/kibana.yml')
    end
    it 'restarts kibana' do 
    	expect(chef_run).to restart_service('kibana4')
    end
  end
end

describe 'df_kibana::kibana_nginx' do 
	let(:chef_run) do 
		runner = ChefSpec::ServerRunner.new
		runner.converge(described_recipe)
	end
	it 'installs nginx' do 
		expect(chef_run).to install_apt_package('nginx')
	end
	it 'installs apache-utils' do 
		expect(chef_run).to install_apt_package('apache2-utils')
	end
	it 'creates nginx config' do 
		expect(chef_run).to create_template('/etc/nginx/sites-available/default')
	end
end