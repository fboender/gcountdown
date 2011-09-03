#!/bin/sh

APPNAME=gcountdown
VERSION=$1

if [ -z $VERSION ]; then
	echo "Version required for this build rule" >&2
	exit
fi

if [ -d 'releases' ]; then
	rm -rf releases
fi

# Create the release directory structure.
mkdir releases
mkdir releases/$APPNAME-$VERSION

# Copy the source to the release directory structure.
cp src/LICENSE.txt releases/$APPNAME-$VERSION/
cp src/README.txt releases/$APPNAME-$VERSION/
cp src/$APPNAME releases/$APPNAME-$VERSION/
cp src/*.png releases/$APPNAME-$VERSION/
cp -r src/pyglet releases/$APPNAME-$VERSION/

# Copy the source to the debian directory structure
cp -ar data/debian releases 
cp src/LICENSE.txt releases/debian/usr/share/$APPNAME/
cp src/README.txt releases/debian/usr/share/$APPNAME/
cp src/$APPNAME releases/debian/usr/share/$APPNAME/
cp src/*.png releases/debian/usr/share/$APPNAME/
cp data/xdg/$APPNAME.desktop releases/debian/usr/share/applications/
cp -ar src/pyglet releases/debian/usr/share/gcountdown/

# Remove some files / directories we don't want in the release.
find releases/ -name ".svn" -type d -print0 | xargs -0 /bin/rm -rf
find releases/ -name "*.pyc" -type f -print0 | xargs -0 /bin/rm -rf

# Bump version numbers
sed -i "s/%%VERSION%%/$VERSION/g" releases/$APPNAME-$VERSION/README.txt
sed -i "s/%%VERSION%%/$VERSION/g" releases/$APPNAME-$VERSION/$APPNAME
sed -i "s/%%VERSION%%/$VERSION/g" releases/debian/DEBIAN/control

# Create package releases.
cd releases
tar -czf $APPNAME-$VERSION.tar.gz $APPNAME-$VERSION/
cd ..

cd releases
dpkg-deb --build debian >/dev/null
mv debian.deb gcountdown-$VERSION.deb 
cd ..

# Clean up
#rm -rf releases/$APPNAME-$VERSION

