<?php

$router = $di->getRouter();

// Define your routes here


$router->add('/setup/board/{page}', [
    'controller' => 'setup',
    'action' => 'board'
]);


/**
 * board 메뉴
 */
$router->add('/board/{board_id}/{page}', [
    'controller' => 'board',
    'action' => 'index'
]);

$router->add('/board/{board_id}/create/', [
    'controller' => 'board',
    'action' => 'create'
]);

$router->add('/board/{board_id}/create/', [
    'controller' => 'board',
    'action' => 'create'
]);

$router->add('/board/{board_id}/select/{idx}', [
    'controller' => 'board',
    'action' => 'select'
]);

$router->add('/board/{board_id}/update/{idx}', [
    'controller' => 'board',
    'action' => 'update'
]);

$router->add('/board/{board_id}/delete/{idx}', [
    'controller' => 'board',
    'action' => 'delete'
]);

$router->handle();
