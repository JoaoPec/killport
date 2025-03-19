# KillPort

`KillPort` is a simple command-line tool written in Go that helps you find and kill processes that are occupying a specific port on your system.

## Usage

To use the program, run the following command in your terminal:

```bash
./killport <port>

Where <port> is the port number you want to check for an active process. If a process is found using the specified port, it will be killed.

Example

./killport 8080

This will search for any process using port 8080 and kill it.

## Installation

To install KillPort globally on your system, use the provided installation script.
Steps

    Download the installation script install_killport.sh.
    Run the script:

bash install_killport.sh

The script will:

    Clone the repository (if not already cloned).
    Compile the Go program.
    Install the executable in /usr/local/bin.

After installation, you can run the killport command from anywhere in your terminal.

-- BY: João Curcino 
