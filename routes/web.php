<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/task1', 'TaskController@task1')->name('task1');
Route::get('/task2', 'TaskController@task2')->name('task2');
Route::get('/task3', 'TaskController@task3')->name('task3');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
