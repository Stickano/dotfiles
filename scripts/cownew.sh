#!/bin/bash
# Update PKGBUILD viewer

for f in ~/makepkg/packages/*/PKGBUILD; do 
		gvim "$f"; 
done 
