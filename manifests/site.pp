### RESOURCE DEFAULTS
# Some resource defaults for Files, Execs and Tiny Puppet
case $::kernel {
  'Darwin': {
    File {
      owner => 'root',
      group => 'wheel',
      mode  => '0644',
    }
    Exec {
      path => $::path,
    }
  }
  'Windows': {
    File {
      owner => 'Administrator',
      group => 'Administrators',
      mode  => '0644',
    }
    Exec {
      path => $::path,
    }
    include chocolatey
  }
  default: {
    File {
      owner => 'root',
      group => 'root',
      mode  => '0644',
    }
    Exec {
      path => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    }
  }
}

# Default options for tp::install
Tp::Install {
  cli_enable   => true,
  test_enable  => true,
  auto_prereq  => true,
}

# We just do everything in tp module
include tp
