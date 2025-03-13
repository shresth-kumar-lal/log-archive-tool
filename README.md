# **Log Archive Script**

## **Overview**
The **Log Archive Script** is a Bash utility designed to compress and archive directories, primarily for log management and backup purposes. It supports multiple compression formats, allows users to specify a custom storage location, and maintains a history of archived files.

## **Features**
- Supports **gzip (`.tar.gz`)**, **bzip2 (`.tar.bz2`)**, and **xz (`.tar.xz`)** compression formats.
- Allows users to specify a **custom storage location** for archived files.
- Includes **error handling** to check for missing directories and invalid inputs.
- Maintains a **log file** (`log-archive-history.txt`) that records all archived files.
- Uses **ANSI color-coded messages** for better readability in the terminal.

## **Installation**
Ensure the script has executable permissions:
```bash
chmod +x log-archive.sh
```
Place the script in a directory included in your `PATH` for easy execution.

## **Usage**
```bash
./log-archive.sh <directory-to-archive> [storage-location] [compression-method]
```

### **Arguments**
| Argument | Description | Default |
|----------|-------------|---------|
| `<directory-to-archive>` | The directory to be archived. | Required |
| `[storage-location]` | Directory where the archive will be saved. | Current working directory |
| `[compression-method]` | Compression type: `gz` (gzip), `bz2` (bzip2), `xz` (xz). | `gz` |

### **Examples**
#### **Basic Usage (Default gzip Compression)**
```bash
./log-archive.sh /var/logs
```
This command archives the `/var/logs` directory into `logs-YYYY-MM-DD.tar.gz` and saves it in the current working directory.

#### **Specify a Storage Directory**
```bash
./log-archive.sh /var/logs /backups
```
This archives the `/var/logs` directory and saves the `.tar.gz` file in `/backups`.

#### **Use bzip2 Compression**
```bash
./log-archive.sh /var/logs /backups bz2
```
This archives the `/var/logs` directory using `bzip2` compression and saves it in `/backups`.

## **Logging**
Each time an archive is created, a record is added to `log-archive-history.txt` in the storage directory. The log file contains timestamps and paths of archived files for reference.

## **Error Handling**
- If no directory is provided, the script displays usage instructions.
- If the specified directory does not exist, the script exits with an error.
- If an invalid compression method is specified, the script defaults to `gzip`.

## **Dependencies**
- `tar` (Pre-installed on most Linux distributions)
- `gzip`, `bzip2`, or `xz` (Depending on the selected compression method)
