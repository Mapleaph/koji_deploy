#!/bin/bash

su - kojiadmin -c "koji add-tag dist-foo"
su - kojiadmin -c "koji add-tag --parent dist-foo --arches \"x86_64\" dist-foo-build"
su - kojiadmin -c "koji add-external-repo -t dist-foo-build dist-foo-external-repo https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/24/Everything/x86_64/os"
su - kojiadmin -c "koji add-target dist-foo dist-foo-build"
su - kojiadmin -c "koji add-group dist-foo-build build"
su - kojiadmin -c "koji add-group dist-foo-build srpm-build"
#su - kojiadmin -c "koji regen-repo dist-foo-build"
su - kojiadmin -c "koji add-group-pkg dist-foo-build build bash bzip2 coreutils cpio diffutils findutils fedora-release gawk grep gzip make patch redhat-rpm-config rpm sed tar shadow-utils texinfo unzip util-linux which xz gcc rpm-build"