# LaTeX Docker Environment CLI

The `latex-env` CLI simplifies the management of LaTeX projects using Docker.

## Available Commands

### 1. `latex-env build <file.tex>`

Compile the specified `.tex` file using Docker.

```bash
latex-env build /path/to/yourfile.tex
```

The compiled PDF and intermediate files will be saved in the `out` directory.

---

### 2. `latex-env init`

Set up VSCode configuration for LaTeX Workshop.

```bash
latex-env init
```

This generates a `.vscode/` directory with the necessary settings and extension recommendations.

---

### 3. `latex-env stop`

Stop and remove the Docker environment.

```bash
latex-env stop
```

---

### 4. `latex-env start`

Start the Docker environment.

```bash
latex-env start
```

---

### 5. `latex-env restart`

Restart the Docker environment.

```bash
latex-env restart
```

---

### Help

To see all available commands:

```bash
latex-env help
```
