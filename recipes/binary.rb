cache_dir = Chef::Config[:file_cache_path]
download_dest = File.join(cache_dir, node['wkhtmltopdf-update']['archive'])

remote_file download_dest do
  source node['wkhtmltopdf-update']['mirror_url']
  checksum node['wkhtmltopdf-update']['archive_checksum'] if node['wkhtmltopdf-update']['archive_checksum']
  mode '0644'
  action :create_if_missing
end

package 'wkhtmltopdf' do
  source download_dest
  not_if "/usr/local/bin/wkhtmltopdf --version | grep #{node['wkhtmltopdf-update']['version']}"
  not_if { source.end_with?('tar.xz') }

  # if source.end_with?('.deb')
  #   provider Chef::Provider::Package::Dpkg
  # elsif source.end_with?('.rpm')
  #   provider Chef::Provider::Package::Rpm
  # end
end

tar_extract download_dest do
  action :extract_local
  compress_char 'J'
  target_dir Chef::Config[:file_cache_path]
  creates "#{Chef::Config[:file_cache_path]}/wkhtmltox"
  only_if { download_dest.end_with?('tar.xz') }
end

execute 'Copy wkhtmltox files' do
  command "cp -a #{Chef::Config[:file_cache_path]}/wkhtmltox/. #{node['wkhtmltopdf-update']['root_dir']}"
  only_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/wkhtmltox") }
end
