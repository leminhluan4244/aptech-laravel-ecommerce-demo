<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            // unisharp
            'Image' => Intervention\Image\Facades\Image::class,
            'PDF' => Barryvdh\DomPDF\Facade::class,
            'PayPal' => Srmklive\PayPal\Facades\PayPal::class,
            'Socialite' => Laravel\Socialite\Facade\Socialite::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
