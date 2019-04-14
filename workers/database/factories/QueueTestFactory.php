<?php

use Faker\Generator as Faker;

$factory->define(App\QueueTest::class, function (Faker $faker) {
    return [
        'run_counter' => 0,
    ];
});
