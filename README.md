# FluffyFriendFinder

Finding fluffy friends around you with SwiftUI and Vision.framework using an iOS device.

## Building

Clone this repository using your favorite graphical tool or the command line.

```sh
git clone https://github.com/mmar/FluffyFriendFinder.git
```

Create a `Developer.xcconfig` file with your Team ID and a unique bundle identifier. You
can copy and edit the included template, just make sure not to include it in the Xcode project,
as it will not be commited to Git. Or use the shell:

```sh
cd FluffyFriendFinder
echo "DEVELOPMENT_TEAM = <Your Team ID>" > Developer.xcconfig
echo "PRODUCT_BUNDLE_IDENTIFIER = <Reverse-DNS Identifier>" >> Developer.xcconfig
```

Use Xcode to normally build and deploy to your device(s).
