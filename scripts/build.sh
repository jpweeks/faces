PATH=$(npm bin):$PATH
rm build/bundle-clmtrackr.js
rm build/bundle-app.js
uglifyjs ./lib/clmtrackr/clmtrackr.js ./lib/clmtrackr/models/model_pca_10_svm.js \
  --compress --mangle > build/bundle-clmtrackr.js
browserify -t [ glslify ] src/index.js | uglifyjs --compress --mangle > build/bundle-app.js
terminal-notifier -title "Faces" -message "Build Complete"
