#!/bin/bash
 
function normalMap()
{
  gimp -i -b "(define (normalMap-fbx-conversion fileName newFileName nscale) (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE fileName fileName))) (drawable (car (gimp-image-get-active-layer image)))) (plug-in-normalmap RUN-NONINTERACTIVE image drawable 7 0.0 nscale 0 0 0 0 0 0 0 0 0.0 drawable ) (gimp-file-save RUN-NONINTERACTIVE image drawable newFileName newFileName) (gimp-image-delete image))) (normalMap-fbx-conversion \"$1\" \"$2\" $3)" -b '(gimp-quit 0)'
}
 
for file in `ls *.png`
do
  normalMap $file `echo $file | sed 's/.png/_normal.png/'` 8     
done
