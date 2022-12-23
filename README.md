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
5. Change default shell to Bash
   ``` bash
   chsh -s bash
   ```

## Homebrew Formulae

``` bash
./formulae.sh
```

Tip: to see Homebrew formulae without incoming dependencies: `brew
leaves`.

## App Store

``` bash
./app-store.sh
```

## System Settings

1. General > About > Name
2. General > Sharing
   * Remote Login > **ON**
   * Remote Management > **ON**
3. Appearance
   * Accent color > **Graphite**
   * Highlight color > **Graphite**
   * Allow wallpaper tinting in windows > **OFF**
   * Show scroll bars > **When scrolling**
4. Accessibility > Display
   * Reduce motion > **ON**
   * Reduce transparency > **ON**
5. Accessibility > Pointer Control > Trackpad Options
   * Use trackpad for dragging > **ON**
6. Control Centre
   * Spotlight > **Don't Show in Menu Bar**
   * Siri > **Don't Show in Menu Bar**
7. Siri & Spotlight
   * Ask Siri > **OFF**
   * Spotlight > Siri Suggestions > **OFF**
8. Desktop & Dock
   * Show recent applications in Dock > **OFF**
9. Displays > Night Shift... > Schedule > **Sunset to sunrise**
10. Game Center > Game Center > **OFF**
11. Keyboard
	* Key repeat rate > **Fast**
	* Delay until repeat > **Short**
12. Keyboard > Press 🌐 key to > **Do Nothing**
13. Keyboard > Keyboard Shortcuts... > Misson Control
	* <kbd>⌃ Control</kbd> + <kbd>↑</kbd> > **OFF**
	* <kbd>⌃ Control</kbd> + <kbd>↓</kbd> > **OFF**
	* <kbd>⌥ Option</kbd> + <kbd>1</kbd> > **ON**
14. Keyboard > Text Input > Edit... > Show Input menu in menu bar > **ON**

## `iTerm2` Settings

* Preferences > Load preferences from a custom folder or URL > **/Users/luca/GIT/mac**  
  Quit `iTerm2` and reopen.

## Safari Settings

1. Tabs > <kbd>⌘ Command</kbd> + <kbd>n</kbd> for tab switch > **OFF**
2. Extensions > Wipr Part 1/2/3 > **ON**
3. Advanced > Show Develop menu in menu bar > **ON**

## Mail Settings

1. General
   * New messages sound > **None**
   * Play sounds for other mail actions > **OFF**
   * Prefer opening messages in Split View when in full screen > **OFF**
2. Viewing
   * Show most recent message at the top > **ON**

## Mail Sidebar

* Add **All Junk**, **All Trash**, **All Archive** to favorite mailboxes.
* Change the "Today" smart mailbox so that only messages
  **received** today (and not messages **viewed** today) are shown.
* Change all the smart mailboxes so that messages from the Sent
  mailbox are included.

## INSTRUCTIONS TO BE UPDATED

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
