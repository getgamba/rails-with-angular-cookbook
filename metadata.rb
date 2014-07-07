name             'rails'
maintainer       'Hirotaka Mizutani'
maintainer_email 'hirotaka@mizutani.to'
license          'All rights reserved'
description      'Installs/Configures rails-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'git'
depends 'apt'
depends 'ruby_build'
depends 'imagemagick'
depends 'mysql'
depends 'zsh'
depends 'rbenv'
depends 'redis'
