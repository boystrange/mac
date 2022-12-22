# Mac Computer Setup

This is how I set up my Mac computers.

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
   * **SET** computer name
2. General > Sharing
   * **ENABLE** Remote Login
   * **ENABLE** Remote Management
3. Appearance > Show scroll bars > **When scrolling**
4. Accessibility > Display
   * **ENABLE** Reduce motion
   * **ENABLE** Reduce transparency
5. Accessibility > Pointer Control > Trackpad Options
   * **ENABLE** Use trackpad for dragging
6. Control Centre
   * Spotlight > **Don't Show in Menu Bar**
   * Siri > **Don't Show in Menu Bar**
7. Siri & Spotlight
   * **DISABLE** Ask Siri
   * **DISABLE** Spotlight > Siri Suggestions
8. Desktop & Dock
   * **DISABLE** Show recent applications in Dock
9. Displays > Night Shift... > Schedule > **Sunset to sunrise**
10. Game Center
	* **DISABLE** Game Center
11. Keyboard
	* Key repeat rate > **Fast**
	* Delay until repeat > **Short**
12. Keyboard > Press 🌐 key to > **Do Nothing**
13. Keyboard > Keyboard Shortcuts... > Misson Control
	* **DISABLE** <kbd>⌃ Control</kbd> + <kbd>↑</kbd>
	* **DISABLE** <kbd>⌃ Control</kbd> + <kbd>↓</kbd>
	* **ENABLE** <kbd>⌥ Option</kbd> + <kbd>1</kbd>
14. Keyboard > Text Input > Edit...
	* **ENABLE** Show Input menu in menu bar

## `iTerm2` Preferences

Open Preferences and enable "Load preferences from a custom folder
or URL" setting the folder to `/Users/luca/GIT/mac`. Quit `iTerm2`
and reopen.

## Safari Preferences

1. Tabs > **DISABLE** <kbd>⌘ Command</kbd> + <kbd>n</kbd> for tab switch
2. Extensions > **ENABLE** Wipr Part 1/2/3
3. Advanced > **ENABLE** Show Develop menu in menu bar

## Mail Preferences

1. General
   * New messages sound > **None**
   * **DISABLE** Play sounds for other mail actions
   * **DISABLE** Prefer opening messages in Split View when in full screen
2. Viewing
   * **ENABLE** Show most recent message at the top

* Add "All Junk", "All Trash", "All Archive" to favorite mailboxes.
* Change the "Today" smart mailbox so that only messages
  **received** today (and not messages **viewed** today) are shown.
* Change all the smart mailboxes so that messages from the Sent
  mailbox are included.

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
