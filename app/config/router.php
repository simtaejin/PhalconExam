<?php

$router = $di->getRouter();

// Define your routes here

$router->add('/board/{board_id}', [
    'controller' => 'board',
    'action' => 'index'
]);

$router->add('/board/{board_id}/{id}', [
    'controller' => 'board',
    'action' => 'index'
]);


$router->handle();
