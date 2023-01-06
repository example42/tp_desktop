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

