<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QueueTest extends Model
{
    /**
     * Guarded from mass assignments.
     *
     * @var array
     */
    protected $fillable = ['run_counter', 'created_at', 'updated_at'];

}
