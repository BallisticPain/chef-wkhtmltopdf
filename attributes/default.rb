# Used for uninstalling old recipe for wkhtmltopdf
default['wkhtmltopdf']['version']     = '0.12.0'
default['wkhtmltopdf']['install_dir'] = '/usr/local/bin'
default['wkhtmltopdf']['lib_dir']     = ''

default['wkhtmltopdf-update']['root_dir'] = '/usr/local'
default['wkhtmltopdf-update']['install_dir'] = '/usr/local/bin'
default['wkhtmltopdf-update']['lib_dir']     = ''
default['wkhtmltopdf-update']['version'] = '0.12.4'

case node['platform_family']
when 'mac_os_x', 'mac_os_x_server'
  default['wkhtmltopdf-update']['dependency_packages'] = []
  default['wkhtmltopdf-update']['platform'] = 'osx-cocoa-x86-64.pkg'
  default['wkhtmltopdf-update']['archive_checksum'] = '402209589279e092c94d17c76e6fdda6be5cadb21ce12e7c093c41f82b757506'
when 'windows'
  default['wkhtmltopdf-update']['dependency_packages'] = []
  default['wkhtmltopdf-update']['platform'] = if node['kernel']['machine'] == 'x86_64'
                                                'msvc2015-win64.exe'
                                                default['wkhtmltopdf-update']['archive_checksum'] = '14a5996adc77dc606944dbc0dc682bff104cd38cc1bec19253444cb87f259797'
                                              else
                                                'msvc2015-win32.exe'
                                                default['wkhtmltopdf-update']['archive_checksum'] = '6883d1456201bc9d421cb7dd32a99458be3d56631ea4f292e51b3c1aecbe2723'
                                              end
else
  default['wkhtmltopdf-update']['dependency_packages'] = value_for_platform_family(
    %w[debian ubuntu] => %w[zlib1g-dev libfontconfig1 libfreetype6-dev libxext6 libx11-dev libxrender1 fontconfig libjpeg8 xfonts-base xfonts-75dpi],
    %w[fedora rhel] => %w[fontconfig libXext libXrender openssl-devel urw-fonts]
  )
  default['wkhtmltopdf-update']['platform'] = if node['kernel']['machine'] == 'x86_64'
                                                default['wkhtmltopdf-update']['archive_checksum'] = '049b2cdec9a8254f0ef8ac273afaf54f7e25459a273e27189591edc7d7cf29db'
                                                'linux-generic-amd64.tar.xz'
                                              else
                                                default['wkhtmltopdf-update']['archive_checksum'] = '4087b264ec860ab0b0f9b7299ef733fc51e8e39f42047a06724b7450016ab9b8'
                                                'linux-generic-i386.tar.xz'
                                              end
end

default['wkhtmltopdf-update']['archive'] = "wkhtmltox-#{node['wkhtmltopdf-update']['version']}_#{node['wkhtmltopdf-update']['platform']}"
default['wkhtmltopdf-update']['archive_checksum'] = nil
default['wkhtmltopdf-update']['mirror_url'] = "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/#{node['wkhtmltopdf-update']['version']}/#{node['wkhtmltopdf-update']['archive']}"
