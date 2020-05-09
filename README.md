# Dock vim

This repo contains docker images for different versions of Vim and its forks.

## Why?

Following a minor backlash with a PR to a plugin that was supposed to work, I realized I needed better testing techniques. Installing several versions of Vim on the same system is not an option, because it gets messy fast.

The idea is to make it easier to test plugins on other versions of Vim without installing several or other versions to test it on one system.

## Building

These images need to be manually built. I might make a shell script for it at some point, but it doesn't exist yet. I might also post it to Docker Hub at some point, but it's not necessary for my use.

Each Vim type has a base dockerfile. I'll get back to the details behind it on a per-type basis. This file contains the boilerplate code required to build. In addition, there's usually an associated .sh file, again, containing boilerplate for the build process itself. Each secondary docker file is in charge of dealing with the actual checkout and building. In most cases, the build itself means executing a standard .sh file containing the build. This is to keep repetitions in the code to a minimum.

A second advantage with using a master container containing all the dependencies and the vim distribution itself is that when the dependencies have been installed and vim has been cloned, it doesn't need to be again. It's all ready for whatever implementation is used.

Anyway, this is boring. The details:

### Building Vim

Vim uses the `dock-vim-base.dockerfile`. This has to be built first, regardless of which version of Vim you want to install:

```bash
docker build -t dock-vim-base -f dock-vim-base.dockerfile .
```

That needs to process for a while, but it'll install all major dependencies. It also compiles Vim with Python 3.

After this, you need to build a version image. If you want Vim 8.1, you'll need:

```bash
docker build -t vim-8.1 -f vim/vim-8.1.dockerfile
```

This will check out the relevant tag, and build Vim. Like I mentioned earlier, holding the code in a master container lets Docker cache it and save time by not needing to re-clone it. The thing that actually takes time is therefore building it.

## Using it

When it's installed, pretty much all you need to do is `docker run` and `docker execute`. After that, you get access to whichever version of Vim you picked.

Here's an example using Vim 8.1:

```bash
# Run it. This is also where you can link in folders.
# Use -v for folder linking. See https://stackoverflow.com/a/23455537/6296561
# Note that Windows with VirtualBox requires some additional config.
# I'm not covering that here.
docker run --name vim-8.1 -di vim-8.1
# This command gives you access to the container terminal:
docker exec -ti vim-8.1
```

# License

This project is licensed under the Unlicense, because container images don't, in my opinion, need much more of a license.

