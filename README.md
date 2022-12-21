# Mac Configuration

This is how I set up my Macs.

## Bootstrap

1. Install **[Homebrew](https://brew.sh)**
   ``` bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Clone **this repository**
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

1. Install `bash` if not available.
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

## System Preferences

1. General > About
   * **Set** computer name
2. General > Sharing
   * **Enable** Remote Login
   * **Enable** Remote Management
3. Appearance > Show scroll bars
   * When scrolling
4. Accessibility > Display
   * **Enable** Reduce motion
   * **Enable** Reduce transparency
5. Accessibility > Pointer Control > Trackpad Options
   * **Enable** Use trackpad for dragging
6. Control Centre
   * Spotlight > Don't Show in Menu Bar
   * Siri > Don't Show in Menu Bar
7. Siri & Spotlight
   * **Disable** Ask Siri
   * **Disable** Spotlight > Siri Suggestions
8. Desktop & Dock
   * **Disable** Show recent applications in Dock
9. Displays > Night Shift... > Schedule
   * Sunset to sunrise
10. Game Center
   * **Disable** Game Center
11. Keyboard
   * **Fast** Key repeat rate
   * **Short** Delay until repeat
12. Keyboard > Press 🌐 key to
   * Do Nothing
13. Keyboard > Keyboard Shortcuts...
   * **Disable** <kbd>⌃ Control</kbd> + <kbd>↑</kbd>
   * **Disable** <kbd>⌃ Control</kbd> + <kbd>↓</kbd>
   * **Enable** <kbd>⌥ Option</kbd> + <kbd>1</kbd>
14. Keyboard > Text Input > Edit...
   * **Enable** Show Input menu in menu bar

## `iTerm2` Preferences

Open Preferences and enable "Load preferences from a custom folder
or URL" setting the folder to `/Users/luca/GIT/mac`. Quit `iTerm2`
and reopen.

## Safari Preferences

1. Tabs > **Disable** <kbd>⌘ Command</kbd> + <kbd>n</kbd> for tab switch
2. Extensions > **Enable** Wipr Part 1/2/3
3. Advanced > **Enable** Show Develop menu in menu bar

## Mail Preferences

1. General
   * New messages sound: **None**
   * **Disable** Play sounds for other mail actions
   * **Disable** Prefer opening messages in Split View when in full screen
2. Viewing
   * **Enable** Show most recent message at the top

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
