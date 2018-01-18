# chef-wkhtmltopdf [![Build Status](https://travis-ci.org/BallisticPain/chef-wkhtmltopdf.svg?branch=master)](http://travis-ci.org/BallisticPain/chef-wkhtmltopdf)

## Description

Installs [wkhtmltopdf](http://wkhtmltopdf.org) static binaries. This cookbook is inspired by https://github.com/bflad/chef-wkhtmltopdf.

Cookbook Compatibility:

 * chef-wkhtmltopdf 0.3.0: wkhtmltopdf 0.12.2
 * chef-wkhtmltopdf 0.3.1: wkhtmltopdf 0.12.2.1
 * chef-wkhtmltopdf 0.4.x: wkhtmltopdf 0.12.2.1
 * chef-wkhtmltopdf 0.5.x: wkhtmltopdf 0.12.4

## Requirements

### Platforms

* CentOS 6
* RedHat 6
* Ubuntu 12.04
* Ubuntu 13.04
* Ubuntu 14.04
* Ubuntu 14.10
* Ubuntu 16.04

### Cookbooks

[Opscode Cookbooks](https://github.com/opscode-cookbooks/)

* [apt](https://github.com/opscode-cookbooks/apt)

## Attributes

These attributes are under the `node['wkhtmltopdf-update']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
dependency_packages | Packages that contain wkhtmltopdf dependencies | String | (auto-detected, see attributes/default.rb)
install_dir | directory to install static binaries | String | /usr/local/bin
lib_dir | directory to install libraries | String | ''
mirror_url | URL for wkhtmltopdf | String | (auto-detected, see attributes/default.rb)
platform | wkhtmltopdf platform and architecture | String | (auto-detected, see attributes/default.rb)
version | wkhtmltopdf version to install | String | 0.12.4

## Recipes

* `recipe[wkhtmltopdf-update]` Installs wkhtmltoimage and wkhtmltopdf
* `recipe[wkhtmltopdf-update::binary]` Installs wkhtmltoimage and wkhtmltopdf static binaries

## Usage

* Add recipe(s) to node's run list

## Testing and Development

Here's how you can quickly get testing or developing against the cookbook thanks to [Vagrant](http://vagrantup.com/) and [Berkshelf](http://berkshelf.com/).

    vagrant plugin install vagrant-berkshelf
    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    git clone git://github.com/ballisticpain/chef-wkhtmltopdf.git
    cd chef-wkhtmltopdf
    vagrant up BOX # BOX being centos5, centos6, debian7, fedora18, fedora19, fedora20, freebsd9, ubuntu1204, ubuntu1210, ubuntu1304, ubuntu1310, ubuntu1404, ubuntu1410, or ubuntu1604

You can then SSH into the running VM using the `vagrant ssh BOX` command.

The VM can easily be stopped and deleted with the `vagrant destroy` command. Please see the official [Vagrant documentation](http://docs.vagrantup.com/v2/cli/index.html) for a more in depth explanation of available commands.

All vagrant up BOX commands will use VirtualBox with the exception of ubuntu14* boxes being able to use either VirtualBox or Parallels depending on what your local provider is set to.

## Contributing

Please use standard Github issues/pull requests and if possible, in combination with testing on the Vagrant boxes.

## Maintainers

* Brian Flad (<bflad417@gmail.com>) [Deprecated ... He's no longer maintaining or merging pull requests. Decided to fork and start fresh.]
* Jarvis Stubblefield (jarvis@vortexrevolutions.com) Twitter: @BallisticPain
* Khaled Blah (kblah@avarteq.de) Twitter: @khaledavarteq

## License

Please see licensing information in: [LICENSE](LICENSE)
