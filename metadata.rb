name 'wkhtmltopdf-update'
maintainer 'Jarvis Stubblefield'
maintainer_email 'jarvis@vortexrevolutions.com'
license 'Apache-2.0'
description 'Installs wkhtmltoimage and wkhtmltopdf'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.5.2'
chef_version '>= 12.0'
source_url 'https://github.com/ballisticpain/chef-wkhtmltopdf'
issues_url 'https://github.com/ballisticpain/chef-wkhtmltopdf/issues'

recipe 'wkhtmltopdf-update', 'Installs the latest wkhtmltoimage and wkhtmltopdf'
recipe 'wkhtmltopdf-update::binary', 'Installs the latest wkhtmltoimage and wkhtmltopdf binaries'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'

depends 'apt'
depends 'tar'
