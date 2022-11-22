# tp desktop - Desktop as Code

tp desktop lets you configure in an easy, reproducible and automatic way the packages (apps) and configuration files you use on your computer(s): Linux, Windows or MacOS.

Bored or reinstalling and configuring your programs and settings on a new computer?
Do you need your ssh, shell, vim, tmux, git, etc. configuration on a new computer?
Do you want to have the same configuration on your laptop and desktop and whatever system you may need?

tp desktop is also for you.

## Who can use tp desktop? What version of tp desktop should I use?

tp desktop comes in two flavors, the base one, this repository, is recommended for:

- **Every computer user**, who is smart enough to consider how useful can be to have a simple file where to specify the applications wanted on every own Windows / Linux / MacOs computer. Check the README for BEGINNERS to learn the basics.

- **Power Users**, who may have different computers and the need to automate the installation and configurations set of applications for different use cases on different OS. README for JUNIORS for details.

Read the Installation docs and, when initialising new tp desktop just run:

```bash
tp desktop init
```

A more complex version, which more advanced features like configuration, git sources management and secrets encryption is a must for:

- **Developers**, **Cloud**, **DevOps**, **Data** engineers, who can quickly configure in Yaml files the configurations needed to setup their working stations: not limited to packages installations but also configurations of home dir files, applications configurations, credentials (with the possibility to encrypt sensitive data), cloning of repositories and so on... README for INTERMEDIATE to learn more.

Initialise a new tp desktop with:

```bash
tp desktop init advanced
```

Who has to manage servers for work can consider using PSICK (Puppet Systems Infraatructure Construction Kit), which is a full featured Puppet control-repo, intended for production environments with at least 50-100 nodes.

- **Infrastructure Developers** (we used to call ourselves **Sysadmins**) who can use this as a gentle introduction to an opinionated Puppet setup and a starting point of a full featured and modern Puppet control repository. Under the hoods, tp desktop is a minimized control-repo which can evolve in a real production use one. For usage of Puppet to manage a whole multi OS servers infrastructure give a look to PSICK (Puppet Infrastructure Construction Kit). More in the 
ADVANCED README (requires some Puppet background).

Initialise a new tp desktop with the full look of a Puppet control-repo:

```bash
```bash
tp desktop init psick
```

## Installation

- Install Puppet
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
cd tp_desktop

# See the available sample desktops configurations
tp desktop list

# Show an available desktop configuration:
tp desktop show <desktop_name>

# Create a new desktop configuration:
vi data/desktops/<hostname>.yaml

# Apply the desktop config matching your hostname as found in data/desktops/<hostname>.yaml
# NOTE: This will install the packages and configure the settings you specified in the desktop config.
sudo tp desktop apply

# Apply the configs in data/desktops/<desktop_name>.yaml
sudo tp desktop apply <desktop_name>

# 
# Test the sample ones. Comment out the apps you don't want to try install
# Note that tp desktop apply does changes on your system based on the Yaml files under data/.
# you need superuser powers to install the packages in the desktop config selected
```


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

Please be aware that as of November 2022, tp-desktop is still in alpha and may not work as expected.

Windows tp command line is not supported yet, (but you can manage Windows apps with tp code ad the apply.ps1 script).

Some applications you configure in your desktop file will fail to install.

Probably it's just a matter of missing [tinydata](https://github.com/examople42/tinydata). Open a [ticket](https://github.com/example42/tinydata/issues) to request support for any application you want to install.


## Contributing

tp desktop is an Open Source project based on example42's Tiny Puppet module [example42/tp](https://forge.puppet.com/example42/tp). They are both developed by Alessandro Franceschi / [example42](https://example42.com).

Puppet is a product and trademark of [Puppet by Perforce](https://puppet.com/).

You can contributo to tp, tinydata or this tp desktop control repo by opening a ticket or a pull request on the relevant GitHub repos.
