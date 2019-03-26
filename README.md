# docker-cfn_nag

This is the repository of the `raniemi/cfn_nag` docker image found in Docker Hub. Latest supported version is 0.3.56.

# Prerequisites

You only need to have `docker` installed to run this `cfn_nag` Docker image and `git` if you wish to clone the project locally.

# Installation

* Download and put the `cfn_nag_*` scripts into a directory that's in your `PATH`.

## Usage

When you run the provided scripts, by default they will use the "latest" Docker image version.  For example:

```bash
$ cfn_nag_rules
$ cfn_nag_scan --help
```

## Custom Usage

If you want to build a specific `VERSION` of `cfn_nag` that is not available on Docker Hub, clone this repository and run the following at the command line:

```bash
$ VERSION=<VERSION> ./build.sh --build
```

Once the new image is in your local registry, pass the `VERSION` you wish to use as an ENV variable to the provided `cfn_nag_*` scripts. For example:

```bash
$ VERSION=<VERSION> cfn_nag_scan -v
```
