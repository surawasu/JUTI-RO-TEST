<?php
return [
    'app_name' => 'JUTI Ragnarok',
    'tagline' => 'จุติไฮคลาส · Midgard Reborn',
    'base_url' => 'http://127.0.0.1:8080',
    'db' => [
        'host' => '127.0.0.1',
        'port' => 3306,
        'name' => 'ragnarok_db',
        'user' => 'rathena',
        'pass' => '',
        'charset' => 'utf8mb4',
    ],
    'server' => [
        'login_host' => '127.0.0.1', 'login_port' => 6900,
        'char_host' => '127.0.0.1',  'char_port' => 6121,
        'map_host' => '127.0.0.1',   'map_port' => 5121,
    ],
    'downloads' => [
        ['name' => 'Google Drive', 'note' => 'Full Client', 'url' => '#'],
        ['name' => 'MEGA', 'note' => 'Mirror', 'url' => '#'],
        ['name' => 'Gofile', 'note' => 'Mirror', 'url' => '#'],
    ],
];
