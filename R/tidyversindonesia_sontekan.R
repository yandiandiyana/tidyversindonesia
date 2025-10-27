##############################################
# IndonesiaRaya Development Cheat Sheet
# RStudio + Git + GitHub + Package Dev
# Save as: IndonesiaRaya_CheatSheet.R
##############################################

# ==========================================
# 1️⃣ Start / Reopen Project
# ==========================================
# Open IndonesiaRaya.Rproj in RStudio
# Make sure R version ≥ 4.5.0
# If using renv, ensure it's active

# ==========================================
# 2️⃣ Git Basics (inside project folder)
# ==========================================
# Check status
# system("git status")

# Stage changes
# system("git add .")

# Commit changes
# system('git commit -m "Describe what you changed"')

# Push to GitHub
# system("git push")

# Pull from GitHub
# system("git pull")

# ==========================================
# 3️⃣ SSH Setup (one-time)
# ==========================================
# Generate SSH key (if not already done)
# In Git Bash:
# ssh-keygen -t ed25519 -C "your.email@example.com"

# Start ssh-agent and add key
# eval $(ssh-agent -s)
# ssh-add ~/.ssh/yourkeyname

# Copy public key and add to GitHub:
# cat ~/.ssh/yourkeyname.pub
# Go to GitHub → Settings → SSH and GPG keys → New SSH key

# Set repo remote to SSH
# system("git remote set-url origin git@github.com:yourusername/IndonesiaRaya.git")

# Test SSH connection
# system("ssh -T git@github.com")

# ==========================================
# 4️⃣ Package Development
# ==========================================
# Load all package functions
# devtools::load_all()

# Document functions
# devtools::document()

# Check package
# devtools::check()

# Build / install locally
# devtools::install()

# Test functions
# halo()
# intip(penguins)
# jumlah(mtcars$mpg)

# ==========================================
# 5️⃣ Optional: Console Colors / Themes
# ==========================================
# Define a theme
# indra_theme <- list(
#   var   = crayon::white,
#   type  = crayon::yellow,
#   value = crayon::cyan,
#   na    = crayon::red
# )

# Apply a theme
# ubah_tema(var="red", type="green", value="white", na="yellow")
# intip(penguins)

# ==========================================
# 6️⃣ Tips
# ==========================================
# - Always commit before making big changes
# - Keep RStudio project in sync with Git
# - Push often to GitHub
# - Use SSH to avoid 403 errors
