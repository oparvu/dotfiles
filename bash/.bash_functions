# -----------------------------------------------------------------------------
# Define custom functions
# -----------------------------------------------------------------------------

# Make directory and then change current directory to the created directory.
# 
# Arguments:
#   $1 - Path to the directory to make.
mdcd() {
    mkdir -p "${1}" && cd "${1}";
}
