fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios encrypt_configs
```
fastlane ios encrypt_configs
```
⚙️ Encrypt configuration using `gpg`. Default directory is `Resources/Configurations`.Recommended to encrypt any secrets e.g **API_KEYS, configuration json/plist** to avoid checking in these file in gitBy using gpg, we can encrypt any files with a **passphrase** and it will be in `.gpg` binary format.User is able to use the decrypt the files by providing a passphrase using gpg". You can refer to the `encrypt_configurations` method on how to encrypt the files. e.g . `gpg --batch --yes --passphrase YOUR_PASSPHRASE --output \"YOUR_INPUT_FILE\" -c \"YOUR_OUTPUT_FILE_.GPG\`
### ios decrypt_configs
```
fastlane ios decrypt_configs
```
⚙️ Decrypt configuration using `gpg`. Default directory is `Resources/Configurations`.By using gpg, we can decrypt all `.gpg` files by providing a passphrase to it.The decrypt_configs lane will be run on every setup lane to enable initial setup.You can refer to the `decrypt_configurations` method on how to encrypt the files.e.g . `gpg --batch --yes --passphrase YOUR_PASSPHRASE --output \"YOUR_INPUT_FILE.GPG\" --decrypt \"YOUR_OUTPUT_FILE\`
### ios carthage_bootstrap
```
fastlane ios carthage_bootstrap
```
⚙️ Bootstrap and download Carthage dependencies from Rome Cache. This will download depedencies following the Cartfile.lock.**Note: This will not update the dependencies.**
### ios setup
```
fastlane ios setup
```
⚙️ Setup dependencies and tools to get ready for development.

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
