## Step 1: Log in as Admin User

1. Log in to the administrator account on the Mac.
2. Open **Terminal**.
3. Add the standard user to the sudo file:

    ```
    dscl . list /users

    ``` 
    ```
    sudo visudo
    ```
    
4. Add the following line at the end of the file:
    
    ```
    username ALL=(ALL) NOPASSWD: ALL
    ```
    
    *(Replace `username` with the actual standard user's username)*
    

## Step 2: Disable System Integrity Protection (SIP)

1. Shut down the system.
2. Boot into **Recovery Mode**:
    - Hold **Command (⌘) + R** while starting up until the Apple logo appears.
3. Open **Utilities > Terminal**.
4. Run the following command to disable SIP:
    
    ```
    csrutil disable
    ```
    
5. Restart the Mac and log in as the standard user.

## Step 3: Modify Application Permissions

1. Open **Terminal** and run:
    
    ```
    sudo chmod -R 777 /Applications
    ```
    
2. Allow admin trust for software updates:
    
    ```
    sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AdminHostTrust --bool YES
    ```
    
3. Grant system-wide application installation permissions:
    
    ```
    sudo security authorizationdb write system.install.app.store allow
    ```
    

## Step 4: Grant Full Disk Access Permissions

1. Open **System Settings**.
2. Navigate to **Privacy & Security > Full Disk Access**.
3. Add the following applications:
    - **Terminal**
    - **Installer**
    - **Disk Utility**

## Step 5: Verify Changes

- Try installing a 3rd party application as a standard user.
- If prompted for admin credentials, ensure permissions have been properly applied.
- Restart if necessary to apply changes fully.

This configuration allows a standard user to install applications without needing admin credentials while ensuring system flexibility.

```
sudo chmod -R 777 /Applications
sudo chmod -R 777 ~/Library
sudo chmod -R 777 /Library/Application\ Support
sudo security authorizationdb write system.install.app-store allow
sudo security authorizationdb write system.install.software allow
sudo security authorizationdb write system.preferences allow
sudo security authorizationdb write system.preferences.security allow
sudo chown -R username /Applications
sudo chown -R username ~/Library
sudo chown -R username /Library/Application\ Support
```


