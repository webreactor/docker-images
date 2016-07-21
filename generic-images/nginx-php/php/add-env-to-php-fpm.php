<?php

preg_match_all('/(\w+)=(.+)$/m', `env`, $matches);

$conf = "\n";
foreach($matches[0] as $line => $raw) {
    if ($matches[1][$line] != "LS_COLORS")
    $conf .= 'env[' . $matches[1][$line] . '] = ' . escapeshellarg($matches[2][$line]) . "\n";
}
echo $conf;
