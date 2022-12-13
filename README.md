# tp desktop - Desktop as Code

tp desktop lets you install and configure in a quick, easy, reproducible and automatic way the packages (apps) and configuration files you use on your own computer(s) and systems: Linux, Windows or MacOS.

Bored or reinstalling and configuring your programs and settings on your new computer?
Do you need your ssh, shell, vim, tmux, git, etc. configuration on a new computer or home on a remote system?
Do you want to have the same configuration on your laptop and desktop and whatever system you may need?

tp desktop is also for you.


## Installation

- Install Puppet (quick oneliner: `wget -O - https://bit.ly/installpuppet | sudo bash`)
- Install and use tp desktop as follows:

    sudo puppet module install example42/tp
    sudo puppet tp setup

You need git to use tp desktop, if you want you can install it directly with tp:

    sudo tp install git

Initialise a new tp desktop git repo:

    tp desktop init


## Usage

Once created a new tp desktop, you can use it to install and configure your applications and settings on your computer(s). Enter the tp desktop directory and run the basic commands (**DO NOT CHANGE the tp_desktop dir name**):

    cd tp_desktop

Now you can start to work with your desktops configurations. You can list the ones available by default (you can/should modify them or add new ones according to your needs):

    tp desktop list

To show the content of one of the available desktop configurations (content from **data/desktops/<desktop_name>.yaml**):

    tp desktop show <desktop_name>

Create or edit a desktop configuration:

    vi data/desktops/<desktop_name>.yaml

To see what would happen if you apply a desktop configuration

    tp desktop preview <desktop_name>

To actually apply a desktop configuration (be aware of this step, as here things are going to configured on your system)

    tp desktop apply <desktop_name>

If the desktop configuration you want to apply tries to install a package or write system files outside your home you need root privileges:

    sudo tp desktop apply <desktop_name>

### One or more desktop configurations

In your usage you can manage and desktops files in various ways:

- Have one file for each desktop. Where as desktop we mean your user setup in your Desktop, Laptop, shell on a remote system or any setup related to a single sistem

- Have different desktop files with different block of configurations to apply according to your needs on one or more systems. These "desktop" files may contain for example: setup of your home files on Linux, MacOS and Windows systems, setup of specific git/ssh/shell... environment

It's your choice if to have a single desktop file for each desktop or client machine you want to configure or have different desktop files.

You be aware that whenever to run **tp desktop apply** you are going to **make changes** on your system, according to the desktop configuration you are applying.

Under the `data/examples` directory you can find sample configurations to adapt and use in your own desktop files. 

Under the `data/desktops` directory you have the desktops configs you see with **list** subcommand, and you can **show**, **preview** or **apply**.

The `data/default.yaml` file contains comfigurations which are always applied to every desktop (it's ok and safe to keep it empty).


## Who can use tp desktop? What version of tp desktop should I use?

tp desktop comes in two flavors, the base one, this repository, is recommended for:

- **Every computer user**, who is smart enough to consider how useful can be to have a simple file where to specify the applications wanted on every own Windows / Linux / MacOs computer.

- **Power Users**, who may have different computers and the need to automate the installation and configurations set of applications for different use cases on different OS.

This repo is what you use when running:

```bash
tp desktop init
```

A more complex version, which more advanced features like configuration, git sources management and secrets encryption is a must for:

- **Developers**, **Cloud**, **DevOps**, **Data** engineers, who can quickly configure in Yaml files the configurations needed to setup their working stations: not limited to packages installations but also configurations of home dir files, applications configurations, credentials (with the possibility to encrypt sensitive data), cloning of repositories and so on... 

Initialise a new tp desktop based on a more advanced template with:

```bash
tp desktop init advanced
```

- **Infrastructure Developers** (we used to call ourselves **Sysadmins**) may use tp desktop as a gentle introduction to an opinionated Puppet setup and a starting point of a full featured and modern Puppet control repository. Under the hoods, tp desktop is a minimized control-repo which can evolve in a real production use one. For usage of Puppet to manage a whole multi OS servers infrastructure give a look to PSICK (Puppet Infrastructure Construction Kit).

Initialise a new tp desktop with the full look of a Puppet control-repo (note that additional operations are needed to fully setup it, refer to the documentations.):

```bash
tp desktop init psick
```

Unless you are a Puppet expert, you should start with the tp desktop base version and then move to the advanced one. Psick for desktop management is overkill, but gives more flexibility and is suitable to manage full servers fleets.

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

Read the [ERRORS.md](ERRORS.md) file to understand the errors you may encounter and, in case, raise an [issue](https://github.com/example42/tinydata/issues) on GitHub or contact Alessandro Franceschi on Twitter @alvagante, via WhatsApp (check [example42.com](https://example42.com) for details).

Please be aware that as of December 2022, tp-desktop is still in beta and may not work as expected.

Windows tp command line is not supported yet, (but you can manage Windows apps with tp code and the apply.ps1 script).

Some applications you configure in your desktop file will fail to install.

Probably it's just a matter of missing [tinydata](https://github.com/examople42/tinydata). Open a [ticket](https://github.com/example42/tinydata/issues) with tag **tinydata request** to request support for any application you want to install.


## Contributing

tp desktop is an Open Source project based on example42's Tiny Puppet module [example42/tp](https://forge.puppet.com/example42/tp). They are both developed by Alessandro Franceschi / [example42](https://example42.com).

Puppet is a product and trademark of [Puppet by Perforce](https://puppet.com/).

You can contributo to tp, tinydata or this tp desktop control repo by opening a ticket or a pull request on the relevant GitHub repos.
