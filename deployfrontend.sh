rsync -r src/ docs/
rsync build/contracts/* docs/
git add .
git commit -m "For GitHub Pages"
git push -u origin master
