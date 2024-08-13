
#!/bin/sh

echo "Building for technology: $TECHNOLOGY, version: $VERSION"
echo "Using manifest file: $MANIFEST_FILE"

case "$TECHNOLOGY" in
  "python")
    echo "Running Python build commands"
    #pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --upgrade pip
    rm -rf .venv
    echo "Creating a virtual environment"
    python -m venv .venv
    . .venv/bin/activate
    echo "Installing requirements"
    pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r $MANIFEST_FILE
    ;;
  "javascript")
    echo "Running JavaScript build commands"
    rm -rf node_modules
    npm cache clean --force
    npm install
    ;;
  *)
    echo "Unsupported technology: $TECHNOLOGY"
    exit 1
    ;;
esac

echo "Build completed"