#!/usr/bin/env ruby

content = `ls *.png`
filenames = content.split("\n")
output    = 'README.md'

filenames.each do |filename|
  cmd ="echo '![#{filename}](./images/#{filename})' >> #{output}"
  system(cmd)
  cmd ="echo '' >> #{output}"
  system(cmd)
end
