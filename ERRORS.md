## Common errors ad how to solve them

The amount of things to cope with when using an "universal installer" as tp, which allows you to install every application on every OS is not small.

In some cases the solution is to install some extra components that are needed for specific cases, in others you may try to do operations which are possible only by privileged users, in others the data to manage a spciefic application on a specific OS is not available (but can be easily added).

Let's review some more or less common errors you might encounter when working with tp desktop, and how to fix them.

### Needs for extra components

In the following cases you need to install some extra components in order to fix the error.

#### Error: Parameter provider failed on Package[XXX]: Invalid package provider 'snap' 

Tp is trying to install a package using snap package manager and it fails.

This happens when you have in your desktop yaml something like:

    package_provider: snap

as in:

    tp::install_hash:
      code:
        settings_hash:
          package_provider: snap

The solution is to install a Puppet module that provides the snap provider:

    sudo puppet module install rootexpert-snap

#### Error: Evaluation Error: Error while evaluating a Resource Statement, Evaluation Error: Error while evaluating a Resource Statement, Unknown resource type: 'vcsrepo'

You are trying to install a desktop file which manages the content of a directory based on a git repository.

This happens when you have in your desktop yaml something like:

    vcsrepo: git

as in:

    tp::dir_hash:
      /home/al/sources/tinydata:
        vcsrepo: git
        source: https://github.com/example42/tinydata

The solution is to install the vscrepo modules that provides the ability to clone git repos:

    sudo puppet module install puppetlabs-vcsrepo


### Need of superpowers

Many activities on the system which are done by tpo desktop may require superuser privileges, because only the root user can, for example, install packages or write to system directories.

In most of these cases the solution is prepend the sudo command to the tp command.

Some common cases:

### Error: Parameter user failed on Exec[....]: Only root can execute commands as other users

To apply your desktop some commands have to be run impersonating other users, as root itself.

Just apply the same desktop as root:

    sudo tp desktop apply <desktop_name>


#### Error: Execution of '/usr/bin/apt-get -q -y -o DPkg::Options::=--force-confold install XXX' returned 100: E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)

On a Debian based system you are trying to install a package as a normal user. You need root powers to do that:

    sudo tp desktop apply <desktop_name>


#### Error: Could not set 'present' on ensure: Operation not permitted @ apply2files /path/to/file

You are trying to manage a file or a directory inside a directory that doesn't exists.

You have to cretae the parent directory first.

So, for example if the error is something like:

    Operation not permitted @ apply2files - /var/tmp/sources/tinydata

you have to create the /var/tmp/sources directory first:

    mkdir -p /var/tmp/sources

If, you get an error like:

    mkdir: cannot create directory ‘/path/to/dir’: Permission denied

you have to run the same command as root:
  
    sudo mkdir -p /var/tmp/sources

Note that in such case you'll need to run as root also the tp desktop apply command:
  
      sudo tp desktop apply <desktop_name>


### Other errors (bugs?)

Some other errors may be caused by bugs in tp desktop or an unorthoodox use of it.

Let's review some of them.

### Error: Evaluation Error: Error while evaluating a Function Call, Could not find class ::tp

tp desktop doesn't find the tp module, that provides the same tp desktop!

This weird condition may happen on a node where puppet agent is running and is managed by a central Puppet server which installs, using tp, something on the node itself but doesn't deploy the tp module.

In such a case be sure to have the tp module locally installed and setup:

    puppet module install example42-tp
    sudo puppet tp setup --modulepath $HOME/.puppetlabs/etc/code/modules/        

Another possible cause is that for some the tp module is installed but not in the modulepath of the puppet agent.

Note, in fact, that the tp command can be installed on the system without having the module example42/tp installed locally. This happens in system managed by Puppet where an agent is running and applies a catalog with resources coming from the tp module (on the Puppet server).

### Error: Evaluation Error: Resource type not found: Tp::Conf (or Tp::Install or Tp::Dir ...)

Some resources provided by tp module are not found. The reason is the same of the previous error: the example42-tp module is not installed on the system or is not found where expected (/etc/puppetlabs/code/environments/modules/tp). You should solve with:

    sudo puppet module install example42-tp



## Puppet runs errors

The output of tp desktop apply or tp desktop preview should start with something like:

    Info: Loading facts
    Info: Loading facts
    Info: Loading facts
    Info: Using environment 'tp_desktop'
    Info: Applying configuration version '1670915823'

whatever is written after these lines is the output of the Puppet apply command. You may find here several different kind of Puppet errors, refer to online documentation or the notes here for more information. If you want support open a ticket on [GitHub](https://github.com/example42/tinydata/issues) with the label **question** and provide:

    - the full error output
    - the content of the desktop files you are trying to apply
    - any useful info on the context and the OS you are using



## Warnings

Some warnings you may see when running tp desktop apply.
### Warning: Scope(Tp::Install[code]): No tinydata found for: XXX in /etc/puppetlabs/code/environments/production/modules/tinydata/data/XXX/hiera.yaml. Trying to install package XXX

You are trying tp install an application for which there's not dedicated tiny data (The app directory  is missing from [this dir](https://github.com/example42/tinydata/tree/master/data)), so tp will try to install the application just using the provided name, relying on the underlining  default package manager.

If the package is found it will be installed, if not you will get an error like:

    Error: /Stage[main]/Main/Tp::Install[XXX]/Package[XXX]/ensure: change from 'purged' to 'present' failed:

The solution is to update tinydata with the correct data to manage the application on your OS.

Feel free to open a ticket on [GitHub](https://github.com/example42/tinydata/issues), in the new issue use the label **tinydata request** and specify the app and the OS(es) you want supported, we will try to provide the correct tinydata as soon as possible.
