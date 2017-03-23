node 'docker-centos','docker-ubuntu' {
  Docker::Run{ ensure => 'absent', }
  class {'docker':
    tcp_bind    => 'tcp://0.0.0.0:4243',
    socket_bind => 'unix:///var/run/docker.sock',
  }
  vcsrepo{'/usr/local/src/dockerfile-sentinel-all':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/openstack-hyper-v/dockerfile-sentinel-all.git'
  }


  case $operatingsystem {
    'Ubuntu':{
      notice('This ubuntu container host executes Ubuntu Based container jobs')
      docker::image{'msopenstack/sentinel-debian':
        ensure  =>  'latest',
      }
      docker::image{'msopenstack/sentinel-ubuntu_xenial':
        ensure  =>  'latest',
      }
      docker::image{'msopenstack/sentinel-ubuntu_trusty':
        ensure  =>  'latest',
      }
    }

    'Centos':{
      notice('This centos container hosts runs a local postgresql server, operations production puppet infra containers, and executes centos based contianer jobs.')

      docker::image{'centos':
        image_tag =>  ['centos7'],
        ensure  =>  'latest',
      }

      docker::image{'msopenstack/sentinel-centos':
        ensure  =>  'latest',
      }
      docker::image{'msopenstack/sentinel-fedora':
        ensure  =>  'latest',
      }
      docker::image{'msopenstack/sentinel-oraclelinux':
        ensure  =>  'latest',
      }

    }

    default:{
      warning("Unsupported ${operatingsystem}")
    }
  }


}
