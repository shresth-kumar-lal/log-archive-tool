# **Log Archiving Script (`log-archive.sh`)**

## **Description**
This script compresses a specified directory into a `.tar.gz` archive with a timestamped filename. It ensures easy log backups by maintaining structured and dated archives.

## **Usage**
```bash
./log-archive.sh <directory-to-archive>
```
- The script takes one argument: the path to the directory you want to archive.
- It creates a `.tar.gz` archive with the format:  
  ```
  <directory_name>-YYYY-MM-DD.tar.gz
  ```
- The archive is saved in the current working directory.

## **Prerequisites**
- Ensure you have `tar` installed (default in most Linux distributions).
- The script requires **execute** permissions. You can grant them using:
  ```bash
  chmod +x log-archive.sh
  ```

## **Parameters**
| Parameter | Description |
|-----------|-------------|
| `<directory-to-archive>` | Path to the directory that needs to be archived. |

## **Output**
- On success, it outputs:
  ```
  Successfully archived log <directory_name>-YYYY-MM-DD.tar.gz to <current-path>
  ```
- On failure (if no directory is provided), it displays:
  ```
  Usage: ./log-archive.sh <directory to archive>
  Try again
  ```

## **Example Usage**
1. **Archiving a directory named `logs`:**
   ```bash
   ./log-archive.sh /var/logs
   ```
   Output:
   ```
   Successfully archived log logs-2025-03-14.tar.gz to /home/user
   ```

2. **Trying to run without a directory argument:**
   ```bash
   ./log-archive.sh
   ```
   Output:
   ```
   Usage: ./log-archive.sh <directory to archive>
   Try again
   ```



   https://roadmap.sh/projects/log-archive-tool

## **Notes**
- The script extracts only the **contents** of the specified directory into the archive, without including the full directory path.
- The resulting `.tar.gz` file is created in the directory where the script is executed.

---
