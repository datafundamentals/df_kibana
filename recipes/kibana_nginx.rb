%w{nginx apache2-utils}.each do |nginx_package|
	apt_package nginx_package do
		action :install
	end
end

#need code to set htpaswd code

template "/etc/nginx/sites-available/default" do 
	source "nginx_config.erb" 
	mode "0644" 
	action :create
end

service 'nginx' do
	action :restart
end
