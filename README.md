# multipull
Bash script to update multiple projects inside a folder from their respective git repositories.

Unlike many similar scripts I found, this performs some safety checks.

* Folders that do not contain a `.git` subfolder are skipped
* If a project is not on the 'develop', 'main' or 'master' branch, it is skipped
* Any projects that contain uncommitted changes are also skipped

## Usage
1. Clone this repository and add its location to your `PATH` variable
1. Navigate to the parent folder containing the clones git projects (i.e. `wp-content/plugins`)
1. Run the script by typing `multipull.sh`
1. The script will loop through all child folders, and execute `git pull` if they pass the safety checks
