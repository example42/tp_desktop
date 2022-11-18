# tp Desktop - Multi OS Desktop Setup as Code

tp Desktop lets you easily and automatically install all the applications you need,
on your Desktop (techically any node), whatever operating systems you are using (Windows, MacOS, Linux).

It does it using Puppet language, so you need to have Puppet installed (don't worry, it's easy, details later).

tp Desktop can be useful for:

- **Every computer user**, who is smart enough to consider how useful can be to have a file where to specify the applications wanted on every own Windows / Linux / MacOs computer. Check the README for BEGINNERS to learn the basics.

- **Power Users**, who may have different computers and the need to automate the installation and configurations set of applications for different use cases on different OS. README for JUNIORS for details.

It's a MUST for:

- **Developers**, **Cloud**, **DevOps**, **Data** engineers, who can quickly configure in Yaml files the configurations needed to setup their working stations: not limited to packages installations but also configurations of home dir files, applications configurations, credentials (with the possibility to encrypt sensitive data), cloning of repositories and so on... README for INTERMEDIATE to learn more.

- **Infrastructure Developers** (we used to call ourselves **Sysadmins**) who can use this as a gentle introduction to an (opinionated) Puppet setup and a starting point of a full featured and modern Puppet control repository. Under the hoods, tp Desktop is a minimized control-repo which can evolve in a real production use one. For usage of Puppet to manage a whole multi OS servers infrastructure give a look to PSICK (Puppet Infrastructure Construction Kit). More in the 
ADVANCED README (requires some Puppet background).

## TL;DR

- Install Puppet
- Install Git
- Install tp Desktop as follows:

```bash
sudo puppet module install example42/tp
sudo puppet tp setup

tp desktop init
cd tp-desktop

# Apply the default desktop configuration in data/default.yaml
sudo tp desktop apply

# See the available sample desktops configurations
ls data/desktops

# Apply the desktop config matching your hostname 
sudo tp desktop apply myhostname # Apply the configs in data/desktops/myhostname.yaml

# Test the sample ones. Comment out the apps you don't want to try install
# Note that tp desktop apply does changes on your system based on the Yaml files under data/.
# you need superuser powers to install the packages in the desktop config selected
```

What you need to know next?

Read the READMEs, following the skill level you have.

To store your changes in your own tp-desktop repository, you can use the following commands:

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

# In case you are not familiar with git, these other commands may be useful:
git log # to see the history of commits
git branch -a # to see the list of local and remote branches
```

tp Desktop is an Open Source project based on example42's Tiny Puppet module [example42/tp](https://forge.puppet.com/example42/tp). They are both developed by Alessandro Franceschi / example42.

Puppet is a product and trademark of [Perforce](https://puppet.com/).

