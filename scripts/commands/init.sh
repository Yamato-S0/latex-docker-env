#!/bin/bash

# Define the output directory for VSCode configuration
VSCODE_DIR=".vscode"

# Create the .vscode directory if it doesn't exist
if [ ! -d "$VSCODE_DIR" ]; then
    mkdir -p "$VSCODE_DIR"
    echo "Created $VSCODE_DIR directory."
fi

# Generate VSCode settings.json
SETTINGS_FILE="$VSCODE_DIR/settings.json"
cat > "$SETTINGS_FILE" <<EOL
{
  "latex-workshop.docker.enabled": true,
  "latex-workshop.docker.image.latex": "latex-docker:latest",
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.latex.outDir": "./out",
  "editor.formatOnSave": true,
  "latex-workshop.latex.tools": [
    {
      "name": "platex",
      "command": "latexmk",
      "args": [
        "-e",
        "\$latex='platex %O -synctex=1 %S';",
        "-e",
        "\$bibtex='pbibtex %O %B';",
        "-e",
        "\$dvipdf='dvipdfmx %O -f ipaex.map -o %D %S';",
        "-f",
        "-pdfdvi",
        "-interaction=nonstopmode",
        "-halt-on-error",  
        "-outdir=./out",
        "%DOC%"
      ]
    },
    {
      "name": "uplatex",
      "command": "latexmk",
      "args": [
        "-e",
        "'=\"uplatex %O -synctex=1 %S\"'",
        "-pdfdvi",
        "-outdir=./out",
        "%DOC%"
      ]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "pLaTeX + dvipdfmx",
      "tools": ["platex"]
    },
    {
      "name": "upLaTeX + dvipdfmx",
      "tools": ["uplatex"]
    }
  ],
  "latex-workshop.latex.recipe.default": "pLaTeX + dvipdfmx"
}
EOL
echo "Generated VSCode settings in $SETTINGS_FILE."

# Generate VSCode extensions.json
EXTENSIONS_FILE="$VSCODE_DIR/extensions.json"
cat > "$EXTENSIONS_FILE" <<EOL
{
  "recommendations": [
    "james-yu.latex-workshop"
  ]
}
EOL
echo "Generated VSCode extensions recommendations in $EXTENSIONS_FILE."

# Success message
echo "VSCode LaTeX environment initialized. Open this folder in VSCode to start working!"