# tp desktop - Desktop as Code

tp desktop lets you configure in an easy, reproducible and automatic way the packages (apps) and configuration files you use on your computer(s): Linux, Windows or MacOS.

Bored or reinstalling and configuring your programs and settings on a new computer?
Do you need your ssh, shell, vim, tmux, git, etc. configuration on a new computer?
Do you want to have the same configuration on your laptop and desktop and whatever system you may need?

tp desktop is also for you.


## Installation

- Install Puppet (quick oneliner: `wget -O - https://bit.ly/installpuppet | sudo bash`)
- Install Git
- Install and use tp desktop as follows:

```bash
sudo puppet module install example42/tp
sudo puppet tp setup

# Initialise a new tp desktop git repo, choose the flavour you need: default, advanced or psick.
tp desktop init
```

## Usage

Once created a new tp desktop, you can use it to install and configure your applications and settings on your computer(s). Enter the tp desktop directory and run the basic commands:

```bash
# The other tp desktop commands must be run from the tp desktop directory (the one created with tp desktop init) 
cd tp_desktop

# See the available sample desktops configurations
tp desktop list

# Show an available desktop configuration:
tp desktop show <desktop_name>

# Create a new desktop configuration:
vi data/desktops/<hostname>.yaml

# Simulate what an apply action would do:
tp desktop preview [desktop_name]

# Apply the desktop desktop matching your hostname as found in data/desktops/<hostname>.yaml
# Note, if run by a non-root user, it may fail in applying resources that require root privileges.
tp desktop apply

# You can apply any configuration yaml file as present in data/desktops/<desktop_name>.yaml
tp desktop apply <desktop_name>

# To apply a desktop configuration as root (NOTE: Packages may be installed and global configuration files may be modified):
sudo tp desktop apply <desktop_name>
```

To add a new desktop, edit the data/desktops/<hostname>.yaml file and add there the configurations you want.

In common usage you can manage desktops files in various ways:

- Have one file for each desktop. Where as desktop we mean your user setup in your Desktop, Laptop, shell on a remote system or any setup related to a single sistem

- Have different desktop files with different block of configurations to apply according to your needs on one or more systems. These "desktop" files may contain for example: setup of your home files on Linux, MacOS and Windows systems, setup of specific git/ssh/shell... environment

 It's your choice if to have a single desktop file for each desktop or client machine you want to configure or have different desktop files.

 different operating systems, but you can also have a single file for all the operating systems you use.
 new desktop name to the desktops array.
Under the examples directory you can find sample configurations to adapt and use in your own desktop files. 

To add 
Adapt the sample ones and create new desktop yaml files under Test the sample ones. Comment out the apps you don't want to try install
# Note that tp desktop apply does changes on your system based on the Yaml files under data/.
# you need superuser powers to install the packages in the desktop config selected

## Who can use tp desktop? What version of tp desktop should I use?

tp desktop comes in two flavors, the base one, this repository, is recommended for:

- **Every computer user**, who is smart enough to consider how useful can be to have a simple file where to specify the applications wanted on every own Windows / Linux / MacOs computer. Check the README for BEGINNERS to learn the basics.

- **Power Users**, who may have different computers and the need to automate the installation and configurations set of applications for different use cases on different OS. README for JUNIORS for details.

This repo is what you use when running:

```bash
tp desktop init
```

A more complex version, which more advanced features like configuration, git sources management and secrets encryption is a must for:

- **Developers**, **Cloud**, **DevOps**, **Data** engineers, who can quickly configure in Yaml files the configurations needed to setup their working stations: not limited to packages installations but also configurations of home dir files, applications configurations, credentials (with the possibility to encrypt sensitive data), cloning of repositories and so on... README for INTERMEDIATE to learn more.

Initialise a new tp desktop based on a more advanced template with:

```bash
tp desktop init advanced
```

Who has to manage servers for work can consider using PSICK (Puppet Systems Infraatructure Construction Kit), which is a full featured Puppet control-repo, intended for production environments with at least 50-100 nodes.

- **Infrastructure Developers** (we used to call ourselves **Sysadmins**) who can use this as a gentle introduction to an opinionated Puppet setup and a starting point of a full featured and modern Puppet control repository. Under the hoods, tp desktop is a minimized control-repo which can evolve in a real production use one. For usage of Puppet to manage a whole multi OS servers infrastructure give a look to PSICK (Puppet Infrastructure Construction Kit). More in the 
ADVANCED README (requires some Puppet background).

Initialise a new tp desktop with the full look of a Puppet control-repo (note that additional operations are needed to fully setup it, refer to the documentations.):

```bash
tp desktop init psick
```

Unless you are a Puppet expert, you should start with the tp desktop base version and then move to the advanced one. Psick for desktop management is overkill, but gives more flexibility and is suitable to manage full servers fleets
.

## Managing your own tp-desktop repository

To save your changes in your local tp-desktop files, you have to use git and create your own repository, and you need a place, like GitHub, GitLab, BitBucket or any other git reposirory where to store your version of tp desktop.

If you are new to git, as in any case, you can start with the following commands:

```bash

# Find in what git branch you are and if there are uncommitted changes
git status

# If you are in the master branch and there are no uncommitted changes
# You csn ensure your local copy of tp-desktop is updated with latest on gitlab
git pull

# Show the origin of your tp-desktop git repository
# Check if it's set to the default one created with tp desktop init or your own
git remote -v
origin	https://github.com/example42/tp-desktop.git (fetch)
origin	https://github.com/example42/tp-desktop.git (push)

# If you want to preserve your changes you have to use your own version of tp-desktop repository
# set it as follows. Point to an URL you can push to, for example:
git remote set-url origin git@github.com/YOURNAME/tp-desktop

# Then switch to a new branch, do your changes and commit as usual:
git checkout -b mybranch # To create a new branch based on current one and switch to it

# Change the files you want to change (e.g. data/desktops/myhostname.yaml)
# Add the files you want to commit
git status
git diff
git add .

# Commit your changes and push them to your git repository
git commit -m "My changes"
git push -u origin mybranch
```

## In case of errors

You will see them, most of them can be solved in a few seconds by who knows what's under the hoods (Puppet, the tp module and its tinydata).

Raise an issue on GitHub or contact Alessandro Franceschi on Twitter @alvagante, via WhatsApp (check [example42.com](https://example42.com) for details) or directly via a ticket here on GitHub.

Please be aware that as of November 2022, tp-desktop is still in alpha and may not work as expected.

Windows tp command line is not supported yet, (but you can manage Windows apps with tp code and the apply.ps1 script).

Some applications you configure in your desktop file will fail to install.

Probably it's just a matter of missing [tinydata](https://github.com/examople42/tinydata). Open a [ticket](https://github.com/example42/tinydata/issues) to request support for any application you want to install.


## Contributing

tp desktop is an Open Source project based on example42's Tiny Puppet module [example42/tp](https://forge.puppet.com/example42/tp). They are both developed by Alessandro Franceschi / [example42](https://example42.com).

Puppet is a product and trademark of [Puppet by Perforce](https://puppet.com/).

You can contributo to tp, tinydata or this tp desktop control repo by opening a ticket or a pull request on the relevant GitHub repos.
