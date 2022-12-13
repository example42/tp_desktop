### RESOURCE DEFAULTS
# Some resource defaults for Files, Execs and Tiny Puppet
case $::kernel {
  'Darwin': {
    Exec {
      path => $facts[path],
    }
  }
  'Windows': {
    Exec {
      path => $facts[path],
    }
    Tp::Install {
      settings_hash => {
        package_provider => 'chocolatey',
      }
    }
    include chocolatey
  }
  default: {
    Exec {
      path => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    }
  }
}

# Default options for some resources
File {
  owner  => $facts[identity][user],
  group  => $facts[identity][group],
}
Tp::Conf {
  owner  => $facts[identity][user],
  group  => $facts[identity][group],
}
Tp::Dir {
  owner  => $facts[identity][user],
  group  => $facts[identity][group],
}
Tp::Install {
  cli_enable   => true,
  test_enable  => true,
  auto_prereq  => true,
}

# We just do everything in tp module
include tp

# Lookups for new tp::resources endpoints.
# They will be moved to tp version 4.0.0
# tp::install
$installs = lookup('tp::installs',Variant[Hash,Array[String]],'deep',{})
case $installs {
  Array: {
    $installs.each |$kk| {
      tp::install { $kk:
        ensure => present,
      }
    }
  }
  Hash: {
    $installs.each |$kk,$vv| {
      tp::install { $kk:
        * => vv,
      }
    }
  }
  String: {
    tp::install { $installs:
      ensure => present,
    }
  }
  default: {
    fail("Unsupported type for ${installs}. Valid types are String, Array, Hash")
  }
}

# tp::dir
$dirs = lookup('tp::dirs',Variant[Hash,Array[String]],'deep',{})
case $dirs {
  Array: {
    $dirs.each |$kk| {
      tp::dir { $kk:
        ensure => present,
      }
    }
  }
  Hash: {
    $dirs.each |$kk,$vv| {
      tp::dir { $kk:
        * => vv,
      }
    }
  }
  String: {
    tp::dir { $dirs:
      ensure => present,
    }
  }
  default: {
    fail("Unsupported type for ${dirs}. Valid types are String, Array, Hash")
  }
}

# tp::conf
$confs = lookup('tp::confs',Variant[Hash,Array[String]],'deep',{})
case $confs {
  Array: {
    $confs.each |$kk| {
      tp::conf { $kk:
        ensure => present,
      }
    }
  }
  Hash: {
    $confs.each |$kk,$vv| {
      tp::conf { $kk:
        * => vv,
      }
    }
  }
  String: {
    tp::conf { $confs:
      ensure => present,
    }
  }
  default: {
    fail("Unsupported type for ${confs}. Valid types are String, Array, Hash")
  }
}
