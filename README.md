# Git Support in Monticello

This project extends [Squeak](www.squeak.org)'s code versioning tool *Monticello* to support git repositories.

It builds upon [filetree](https://github.com/dalehenrich/filetree), which allows for exporting source code from the Squeak image into the file system.
Then, other tools may operate on that content such as regular git tool do.
This project uses [OSProcess](http://www.squeaksource.com/OSProcess.html) to call the host's git implementation for clone, commit, and push code.

At the moment, it supports Linux and Windows systems by reusing the host's environment variables to find the git implementation.
Authentication (HTTPS, SSH) is handled by git, not us.

We have chosen the package name *Metacello-Git* to tie on [Metacello](https://github.com/dalehenrich/metacello-work)'s extensions for Monticello.

## Monticello Repositories

There are three different repositories that exploit different stages of git functionality:

- **MCGitRepository** just commits into a local repository.
- **MCRemoteGitRepository** commits *and* pushes new contents.
- **MCGitHubRepository2** forks the repository if there are no access permissions. Then commits and pushes new contents.

All replicate the Monticello *commit message* for git to avoid having to re-type it.
All *pull* the current contents before writing the new contents into the file system.
**Thanks to the way Monticello works, there will be a push for every commit.**

## Clone

When adding a new repository to Monticello, it will be cloned into the *package-cache* directory of Squeak.
For the code, a *repository* directory is assumed and will be created if not existing.

## Merge

If the *pull* delivers new contents, we make use of Monticello's merging tools.
At the moment, we assume that the *pull* in front of a *commit* and *push* will be sufficient to avoid conflicts.

## MCZ (Monticello Zip)

There will be still copies of the *Monticello Zip Files* in the package cache repository.
The corresponding file name will be added to git commit messages.
