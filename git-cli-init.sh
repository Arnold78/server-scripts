## Setup new repo through cli to github.com

echo "# server-scripts" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Arnold78/server-scripts.git
git push -u origin main
