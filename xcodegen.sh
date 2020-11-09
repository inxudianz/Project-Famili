for d in `find . -name "*project.yml"`; 
    do (xcodegen generate --spec "$d"); 
done
