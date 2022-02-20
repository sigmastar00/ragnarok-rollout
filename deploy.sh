#! /bin/bash

godot --no-window --export html.release export/html.release/index.html 
godot --no-window --export linux.release export/linux.release/ragnarok-rollout.x86_64 
godot --no-window --export windows.release export/windows.release/ragnarok-rollout.exe 
godot --no-window --export osx.release export/osx.release/ragnarok-rollout.zip

read -p "Build complete. Are you sure you want to upload? (y/n)" answer
case ${answer:0:1} in
    y|Y )
        :
    ;;
    * )
        echo Stopping.
        exit
    ;;
esac


echo Beginning upload!

butler push --if-changed export/html.release/ sigmastar/ragnarok-rollout:html
butler push --if-changed export/linux.release/ sigmastar/ragnarok-rollout:linux
butler push --if-changed export/windows.release/ sigmastar/ragnarok-rollout:windows
butler push --if-changed export/osx.release/ sigmastar/ragnarok-rollout:osx


