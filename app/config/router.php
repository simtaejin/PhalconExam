<?php

$router = $di->getRouter();

// Define your routes here

$router->add('/board/{board_id}/{page}', [
    'controller' => 'board',
    'action' => 'index'
]);

$router->add('/board/{board_id}/new/', [
    'controller' => 'board',
    'action' => 'new'
]);

$router->add('/board/{board_id}/edit/{idx}', [
    'controller' => 'board',
    'action' => 'edit'
]);

$router->add('/board/{board_id}/delete/{idx}', [
    'controller' => 'board',
    'action' => 'delete'
]);

$router->handle();
