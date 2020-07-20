#!/bin/bash

#pkg=$1
tag=$2

#if [ -z "${pkg}" ] || [ -z "${tag}" ]; then
#    echo "Usage: $0 pkg tag"
#    exit
#fi

if [ -z "${tag}" ]; then
    echo "Usage: $0 tag"
    exit
fi

su - kojiadmin -c "koji import ${pkg}"
su - kojiadmin -c "koji list-pkgs --quiet | xargs koji add-pkg --owner kojiadmin ${tag}"
#su - kojiadmin -c "koji list-untagged | xargs -n 1 koji call tagBuildBypass ${tag}"
#su - kojiadmin -c "koji list-pkgs --quiet | xargs koji add-group-pkg dist-foo-build srpm-build ${tag}"