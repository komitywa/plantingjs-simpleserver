#!/bin/bash

# Skrypt do automatycznego budowania aplikacji w określonych interwałach czasowych - strasznie łopatologicznie, nie paczać!

while [ 1 ]
do
    cd ../../plantingjs
    git pull
    npm run build
    cd ../plantingjs-simpleserver/src
    git pull
    rm -r static/plantingjs-engine
    cp -R ../../plantingjs/dist static/plantingjs-engine/ 
    cp -R ../../plantingjs/dist/objects static/
    cp -R ../../plantingjs/dist/manifesto.js static/
    python create_db.py
    killall python
    python planting.py &
    sleep 900
done
