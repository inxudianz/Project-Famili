for fileName in `find . -name "*project.yml"`;
    do (xcodegen generate --spec "$fileName"); 
done
