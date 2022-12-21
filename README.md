# Mac Configuration

This is how I set up my Macs.

## Bootstrap

1. Install **[Homebrew](https://brew.sh)**

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Clone **repository**

```bash
mkdir GIT && cd GIT
git clone git@github.com:boystrange/mac.git
cd mac/scripts
```

3. Copy **SSH** keys into `~/.ssh` and set up permissions.

``` bash
./ssh.sh
```

4. Create **symbolic links** to configuration files

``` bash
./links.sh
```

## Default Shell

1. If not available install `bash`.
   ``` bash
   brew install bash
   ```
2. If not listed, add `bash` to system shells.
   ``` bash
   sudo -i
   vim /etc/shells
   ```
   and add `/usr/local/bin/bash` at the bottom.
3. Change default shell
   ``` bash
   chsh -s bash
   ```

## Fonts

``` bash
./fonts.sh
```

## App Store

``` bash
./app-store.sh
```

## Homebrew formulae

``` bash
./formulae.sh
```

To see **leaves**: `brew leaves`

## `iTerm2` Preferences

Open Preferences and enable "Load preferences from a custom folder
or URL" setting the folder to `/Users/luca/GIT/mac`. Quit `iTerm2`
and reopen.

## System Preferences

1. Disable Siri & Spotlight > Siri Suggestions
2. Disable Keyboard > Keyboard Shortcuts... > Mission Control
   * `^↑`
   * `^↓`
3. Enable Keyboard > Keyboard Shortcuts... > Mission Control
   * Switch to Desktop 1 > `ALT-1`
4. Accessibility > Pointer Control > Trackpad Options > Use trackpad for dragging
5. Accessibility > Display > Reduce motion
6. Keyboard > Keyboard
   * Key Repeat = FAST
   * Delay = SHORT
7. General > Name
   * Set computer name
8. General > Sharing
   * Enable Remote Login
9. Displays > Night Shift... > Schedule
   * Sunset to sunrise

## Safari Preferences

1. Advanced > Show Develop menu in menu bar
2. Preferences > Tabs > disable `CMD-n` for tab switch

## POSSIBLY OUTDATED

## Ruby Gems

``` bash
gem install --user-install bundler jekyll jekyll-scholar
```

If upgrade of **openssl** fails:

``` bash
gem install --user-install openssl -- --with-openssl-dir=/usr/local/opt/openssl
```

## Viscosity

Look for license in mail.

## NPM

``` bash
npm install -g less
npm install -g less-plugin-clean-css
npm install -g puppeteer-core
```

Some useful commands:

* To **uninstall** modules: `npm uninstall -g <nome modulo>`
* To see list of installed modules: `npm list -g --depth 0`
* To **upgrade** modules: `npm upgrade -g`
