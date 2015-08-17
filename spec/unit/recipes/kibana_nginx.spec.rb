require 'spec_helper'

describe 'df_kibana::kibana_nginx' do 
	let(:chef_run) do 
		runner = ChefSpec::ServerRunner.new
		runner.converge(described_recipe)
	end
	it 'installs nginx' do 
		expect(chef_run).to install_package('nginx')
	end
	it 'installs apache-utils' do 
		expect(chef_run).to install_package('apache-utils')
	end
end