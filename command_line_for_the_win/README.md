---

# Uploading Files to Remote Server using SFTP

## Overview

This guide provides step-by-step instructions on how to upload files to a remote server using the Secure File Transfer Protocol (SFTP). SFTP is a secure and efficient method for transferring files between a local machine and a remote server.

### Prerequisites

- Access to a remote server with SFTP capabilities.
- SFTP username, hostname, and password for the remote server.
- Local machine with SFTP command-line tool installed (commonly included in OpenSSH installations).

## Steps

### 1. Take Screenshots or Prepare Files

Before initiating the upload process, ensure you have the files ready for transfer. In this example, we'll use the scenario of uploading screenshots.

### 2. Open Terminal or Command Prompt

On your local machine, open a terminal or command prompt. This is where you'll enter the commands to connect to the remote server and upload files.

### 3. Connect to the Remote Server via SFTP

Use the `sftp` command to establish a connection to the remote server. Replace `[username]`, `[hostname]`, and `[password]` with your actual credentials.

```bash
sftp [username]@[hostname]
```

### 4. Navigate to the Target Directory on the Remote Server

Once connected, navigate to the directory on the remote server where you want to upload the files.
This is done using the `cd` command.
To navigate through directories of the local server, use the `lcd` command 

```bash
cd /path/to/target/directory
```

### 5. Upload Files from Local Machine to Remote Server

Use the `put` command to upload files from your local machine to the remote server. Replace `/path/to/local/files/*` with the actual path to your files.

```bash
put /path/to/local/files/*
```

### 6. Confirm Successful Transfer

Confirm that the files have been successfully transferred by listing the contents of the remote directory.

```bash
ls
```

Ensure that your files are listed among the files in the remote directory.

### 7. Close the SFTP Connection

After confirming the successful transfer, close the SFTP connection.

```bash
exit
```

## Conclusion

You have successfully uploaded files to a remote server using SFTP. This method provides a secure and reliable way to transfer files between your local machine and a remote server.

---
