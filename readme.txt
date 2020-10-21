
Run Manually
==============

hugo new site knetsolutions
cd knetsolutions
git clone https://github.com/knetsolutions/educenter-hugo.git
cd educenter-hugo/exampleSite
#generating pages
hugo server -D  --baseURL "http://knetsolutions.in/" --bind `hostname -I` -p 8080 --themesDir ../..

Build docker image
==================
hugo new site knetsolutions
cd knetsolutions
git clone https://github.com/knetsolutions/educenter-hugo.git
cd educenter-hugo/exampleSite
#generating pages
hugo  --themesDir  ../..

