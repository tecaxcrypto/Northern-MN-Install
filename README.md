KYD-Masternode-Guide-VPS

System requirements - USE AN UBUNTU LINUX 16.04 VPS for best results

Funding your Masternode

• First, we will do the initial collateral TX and send exactly 10.000 KYD to one of our addresses. To keep things sorted in case we setup more masternodes we will label the addresses we use.

• Open your KYD wallet and switch to the "Receive" tab.

• Click into the label field and create a label, I will use "MN1"

• Now click on "Request payment"

• The generated address will now be labelled as MN1 If you want to setup more masternodes just repeat the steps so you end up with several addresses for the total number of nodes you wish to setup. Example: For 10 nodes you will need 10 addresses, label them all.

• Once all addresses are created send 10.000 KYD each to them. Ensure that you send exactly 10.000 KYD and do it in a single transaction. You can double check where the coins are coming from by checking it via coin control usually, that's not an issue.

• As soon as the transaction is done, we will wait for 20 confirmations. You can check this in your wallet or use the explorer. It should take around 30 minutes if all transaction have 20 confirmations

Installation & Setting up your Server

Generate your Masternode Private Key

In your wallet, open Tools -> Debug console and run the following command to get your masternode key:

masternode genkey

Please note: If you plan to set up more than one masternode, you need to create a key with the above command for each one. Run this command to get your output information:

masternode outputs

Copy both the key and output information to a text file.

Close your wallet and open the KYD Appdata folder. Its location depends on your OS.

• Windows: Press Windows+R and write %appdata% - there, open the folder KYD.

• macOS: Press Command+Space to open Spotlight, write ~/Library/Application Support/KYD and press Enter.

• Linux: Open ~/.KYD/

In your appdata folder, open masternode.conf with a text editor and add a new line in this format to the bottom of the file:

masternodename ipaddress:3434 genkey collateralTxID outputID

An example would be

mn1 127.0.0.2:3434 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg

2bcd3c84c84f87eaa86e4e56834c92927a07f9e18718810b92e0d0324456a67c 0

masternodename is a name you choose, ipaddress is the public IP of your VPS, masternodeprivatekey is the output from masternode genkey, and collateralTxID & outputID come from masternode outputs. Please note that masternodename must not contain any spaces, and should not contain any special characters.

Restart and unlock your wallet.

SSH (Putty on Windows, Terminal.app on macOS) to your VPS, login as root (Please note: It's normal that you don't see your password after typing or pasting it) and run the following command:

wget https://github.com/kydcoin/KYD-MN-Install/blob/master/kyd-install.sh && chmod +x kyd-install.sh && ./kyd-install.sh




When the script asks, confirm your VPS IP Address and paste your masternode key (You can copy your key and paste into the VPS if connected with Putty by right clicking)

The installer will then present you with a few options.

PLEASE NOTE: Do not choose the advanced installation option unless you have experience with Linux and know what you are doing - if you do and something goes wrong, the KYD team CANNOT help you, and you will have to restart the installation.

Follow the instructions on screen. After the basic installation is done, the wallet will sync. You will see the following message:

Your masternode is syncing. Please wait for this process to finish.

This can take up to a few hours. Do not close this window.

Once you see "Masternode setup completed." on screen, you are done.

To check your masternode status on your VPS, just write on console

./kydd masternode status

If you have any issues, please be sure to join our Discord and ask for support:
