# install a package (flask@2.1.0 via pip3)

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
