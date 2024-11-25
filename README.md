# LaTeX Docker Environment

A simple and clean LaTeX development environment using Docker and VSCode. This project provides a CLI tool (`latex-env`) for managing your LaTeX workflow efficiently without requiring a local LaTeX installation.

---

## Features

- **Dockerized LaTeX environment**: No local dependencies required.
- **Simple CLI tool**: Manage LaTeX builds and environment setup with `latex-env`.
- **Flexible**: Works with any LaTeX project directory.
- **VSCode compatible**: Easily integrate with LaTeX Workshop for live PDF preview.

---

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/Yamato-S0/latex-docker-env.git
cd latex-docker-env
```

### 2. Run the setup script

```bash
./scripts/setup.sh
```

- This installs the `latex-env` command globally, allowing you to use it from any directory.
- The script also builds the Docker image for the LaTeX environment.

**If you encounter a permission error**, make the script executable and re-run:

```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### 3. Verify the installation

Run the following command to ensure `latex-env` is installed correctly:

```bash
latex-env help
```

---

## Usage

### Build a `.tex` file

Navigate to the directory containing your `.tex` file and run:

```bash
latex-env build main.tex
```

This command compiles the specified LaTeX file using the Docker environment and generates a PDF in the same directory.

### Manage Docker Environment

- **Start the environment**:

```bash
latex-env start
```

Starts the Docker containers for the LaTeX environment.

- **Stop the environment**:

```bash
latex-env stop
```

Stops and removes the Docker containers.

- **Restart the environment**:

```bash
latex-env restart
```

Restarts the Docker containers for the LaTeX environment.

### Show available commands

```bash
latex-env help
```

Displays the available commands and their descriptions.

---

## Troubleshooting

### Docker image not found

If you encounter an error like `Unable to find image 'latex-docker:latest' locally`, make sure the Docker image is built:

```bash
docker-compose build
```

### Docker not running

Ensure Docker is installed and running:

```bash
docker --version
```

If Docker is not running, start it and try again.

---

## Uninstallation

To remove the `latex-env` CLI command:

```bash
sudo rm /usr/local/bin/latex-env
```

---

## Contributing

Feel free to submit issues or pull requests for bug fixes or feature enhancements. Contributions are welcome!

---

This setup ensures a clean, reproducible, and efficient LaTeX environment for your projects. Enjoy seamless LaTeX development without the hassle of local installations! 🎉
