<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Posting extends Model
{
      protected $fillable = [
        'uuid', 'name','status'
         ];
}
